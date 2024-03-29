class LikesController < ApplicationController

  def create
    post_id = params[:post_id]

    if !!current_user
      liked = Like.find_by(post_id: post_id, user_id: current_user.id)

      if !liked
        like = Like.create(post_id: post_id, user_id: current_user.id)
      else
        liked.destroy
      end

    end
    redirect_to posts_path
  end

end
