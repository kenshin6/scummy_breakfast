class StaticPagesController < ApplicationController
  def home
    if params[:tag]
      @feed_items = Post.includes(:tags, :images, :user).tagged_with(params[:tag]).paginate(page: params[:page])
    else
      @feed_items = Post.includes(:tags, :images, :user).paginate(page: params[:page])
    end
  end

  def contact
  end

  def about
  end
end
