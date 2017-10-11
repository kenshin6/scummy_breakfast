module PostsHelper
  def tag_links(tags)
    links = tags.split(",").map do |tag|
      if params[:tag] == tag.strip
        link_to (tag.strip + " (x)"), root_path
      else
        link_to tag.strip, tag_path(tag.strip)
      end
    end
    links.join(", ")
  end

  def tag_link_with_count(tag)
    tag_count = tag.posts.count
    link_to (tag.name + " (#{tag_count})"), tag_path(tag.name)
  end
end
