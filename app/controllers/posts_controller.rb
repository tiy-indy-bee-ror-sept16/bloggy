class PostsController < ApplicationController

  before_action :require_login, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    # Technique One
    # @post = Post.new(post_params)
    # @post.user = current_user
    # if current_user.posts << @post
    # Technique Two
    # @post = Post.new(post_params)
    # @post.user = current_user
    # if @post.save
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = "Your post is posted!"
      redirect_to posts_path
    else
      render :new
    end
  end

  private


  def post_params
    params.require(:post).permit(:title, :body)
  end

end
