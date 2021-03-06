class PostsController < ApplicationController
  before_filter :authenticate_user!, except: :index
  load_and_authorize_resource
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.order('id DESC').page(params[:page] || 1)
  end

  def show; end

  def new
    @post = current_user.posts.new
    @post.build_image
  end

  def edit; end

  def create
    @post = current_user.posts.new(post_params)
    @post.build_image if @post.image.nil?

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: t('post_was_successfully_created') }
        format.js
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: t('post_was_successfully_updated') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: t('post_was_successfully_destroyed') }
      format.js
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(
      :title,
      :body,
      image_attributes: %i[id file]
    )
  end
end
