class PostsController < ApplicationController
  before_action :get_post, except: [:create, :destroy, :new]
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :admin_user,     only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if params[:preview_button]
      render 'preview'
    else
      if @post.save
        flash[:success] = "Post created!"
        redirect_to @post
      else
        @feed_items = []
        render 'static_pages/home'
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def show
  end

  def preview
  end

  def destroy
    @post.destroy
    flash[:success] = "Post deleted"
    redirect_to request.referrer || root_url
  end

  private

    def post_params
      params.require(:post).permit(:content, :title)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end

    def get_post
      @post = Post.find(params[:id])
    end
end
