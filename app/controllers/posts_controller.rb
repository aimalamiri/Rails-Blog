class PostsController < ApplicationController
  def index
    @user = User.find params[:user_id]
  end

  def new
  end

  def show
    @post = Post.find params[:id]
  end
end
