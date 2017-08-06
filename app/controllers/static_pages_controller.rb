class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @post = current_user.posts.build
    end
    @feed_items = Post.all.paginate(page: params[:page])
  end

  def contact
  end

  def about
  end
end
