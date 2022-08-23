class PostsController < ApplicationController
  def index
    @user = User.includes(:posts, :comments).find(params[:user_id])
  end

  def show
    @post = Post.find params[:id]
  end

  def new; end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "#{@post.title} has been added successfully."
      redirect_to user_posts_url current_user
    else
      flash[:error] = 'Creating new post failed'
      render new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text).merge!(user_id: params[:user_id])
  end
end
