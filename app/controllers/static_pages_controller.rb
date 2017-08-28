class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @post = current_user.posts.build
    end
    if params[:tag]
      @feed_items = Post.tagged_with(params[:tag]).paginate(page: params[:page])
    else
      @feed_items = Post.all.paginate(page: params[:page])
    end
  end

  def contact
  end

  def about
  end
end
