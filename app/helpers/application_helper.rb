module ApplicationHelper
  def full_title(page_title = '')
    base_title = "A blog about coding, climbing, and Japan."
    if page_title.empty?
      base_title
    else
      page_title
    end
  end
end
