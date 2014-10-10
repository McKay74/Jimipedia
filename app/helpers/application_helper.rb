module ApplicationHelper
  def markdown_render(block)
    m = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
    m.render(block)
  end
end
