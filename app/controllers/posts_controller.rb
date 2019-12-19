class PostsController < ApplicationController
  before_action :logged_in_user, only: %i[new create]
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      log_in @post
      flash[:success] = 'Welcome to the Sample App!'
      redirect_to @post
    else
      render 'new'
    end
  end

  def post_params
    params.require(:post).permit(:content, :user_id)
  end

  private

  # Confirms a valid user.
  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = 'Please log in'
    redirect_to login_url
  end
end
