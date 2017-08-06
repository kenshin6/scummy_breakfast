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
        @post.images.create!(file: params[:post][:main_image], main: true) if params[:post][:main_image]
        if params[:post][:image_data]
          params[:post][:image_data].each do |file|
            @post.images.create!(file: file)
          end
        end
        flash[:success] = "Post created!"
        redirect_to @post
      else
        @feed_items = []
        render 'static_pages/home'
      end
    end
  end

  def edit
  end

  def update
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
      params.require(:post).permit(:content, :title, image_data: [])
    end

    def correct_user
      @post = current_user.posts.friendly.find(params[:id])
      redirect_to root_url if @post.nil?
    end

    def get_post
      @post = Post.friendly.find(params[:id])
    end
end
