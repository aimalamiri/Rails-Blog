class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)

    if comment.save
      flash[:success] = 'The post has been commented successfully!'
    else
      flash[:error] = 'Failed to comment!'
    end

    redirect_to user_post_url(current_user, comment.post)
  end

  def destroy
    Comment.destroy params[:id]
    redirect_to user_post_url(user_id: params[:user_id], post_id: params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :post_id)
  end
end
