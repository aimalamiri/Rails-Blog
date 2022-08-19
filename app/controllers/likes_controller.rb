class LikesController < ApplicationController
  def create
    like = Like.create({ user_id: current_user.id, post_id: params[:post_id] })
    redirect_back(fallback_location: user_post_url(like.user, like.post))
  end
end
