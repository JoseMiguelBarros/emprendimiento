class FollowshipsController < ApplicationController
  before_filter :signed_in_user

  def create
    
    @idea = Idea.find(params[:followship][:followed_idea_id])
    current_user.follow!(@idea)
    respond_to do |format|
      format.html { redirect_to @idea }
      format.js
    end
  end

  def destroy
    @idea = Followship.find(params[:id]).followed_idea
    current_user.unfollow!(@idea)
    respond_to do |format|
      format.html { redirect_to @idea }
      format.js
    end
  end
end
