module ApplicationHelper
  def full_title(page_title = '')
    base_title = "A blog about coding, climbing, and Japan."
    if page_title.empty?
      base_title
    else
      page_title
    end
  end

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true, 
                                                                strikethrough: true, filter_html: true,
                                                                hardwrap: true, highlight: true,
                                                                fenced_code_blocks: true, lax_spacing: true,
                                                                underline: true)

    markdown.render(text).html_safe
  end

  def writer_access?
    logged_in? && current_user.admin?
  end
end
