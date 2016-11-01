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
    # render plain: params.inspect
    @post = current_user.posts.new(post_params)
    # @post = Post.new(post_params)
    if @post.save
      topic_names = params[:post][:topic_names].split(",")
      topic_names = topic_names.collect(&:strip)
      topic_names.each do |name|
        @post.topics << Topic.find_or_initialize_by(name: name)
      end
      flash[:success] = "Your post is posted!"
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private


  def post_params
    params.require(:post).permit(:title, :body, :summary)
  end

end
