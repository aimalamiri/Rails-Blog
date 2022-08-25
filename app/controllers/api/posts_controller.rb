class Api::PostsController < ApplicationController
  def index
    @user = User.includes(:posts).find(params[:user_id])
    render json: @user.posts
  end

  def comments
    @post = Post.includes(:comments).find(params[:post_id])
    render json: @post.comments
  end
end
