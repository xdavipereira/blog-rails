class ProjectsController < ApplicationController

	before_action :find_project, only: [:show, :edit, :update, :destroy]

	def index
		@projects = Project.all.order("created_at").paginate(page: params[:page], per_page: 10)
	end

	def show
	end

	def new
		@project = Project.new
	end


	def create 
		@project = Project.new project_params
		if @project.save
			redirect_to @project, notice: "Your project has been saved!"
		else 
			render 'new', notice: "Problem when save your project."
		end
	end


	def edit
	end


	def update
		if @project.update project_params
			redirect_to @project, notice: "Project has been updated"
		else 
			render 'edit'
		end
	end

	def destroy
		@project.destroy
		redirect_to projects_path
	end


	private

	def project_params
		params.require(:project).permit(:title,:description,:link,:slug)
	end

	def find_project
		@project = Project.friendly.find(params[:id])
	end

end
