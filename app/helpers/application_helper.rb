module ApplicationHelper

	def markdown(content) 
		renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
		options = {
			autolink: true,
			no_intra_emphasis: true,
			disable_idented_code_blocks: true,
			fenced_code_blocks: true,
			lax_html_blocks: true,
			superscript: true
		}

		Redcarpet::Markdown.new(renderer, options).render(content).html_safe
	end
end
