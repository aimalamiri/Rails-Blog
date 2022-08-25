class Api::CommentsController < ApplicationController
  def create
    if user_signed_in?
      comment = Comment.new(comment_params)
      comment.user_id = current_user.id
      if comment.save
        render json: 'Commente has been created successfully!', status: :created
      end
    else
      render json: 'The resource does not found', status: :unauthorized
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
