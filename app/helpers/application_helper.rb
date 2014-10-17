module ApplicationHelper
  def markdown_render(block)
    m = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
    m.render(block)
  end
  def stripe_btn_data
    @stripe_btn_data = {
    key: "#{ Rails.configuration.stripe[:publishable_key] }",
    description: "Premium Membership - #{current_user.name}",
    amount: 10_00
  }
  end
end
