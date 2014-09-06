class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Post was created.'
      redirect_to posts_path
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Post was updated.'
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = 'Post was destroyed.'
    redirect_to posts_url
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :description, category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
