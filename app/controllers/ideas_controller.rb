class IdeasController < ApplicationController
  before_filter :signed_in_user

  def create
    @idea = current_user.ideas.build(params[:idea])
    @brand = Brand.find(params[:brand_id])
    @idea.brand_id = @brand.id
   
	
    if @idea.save
      flash[:success] = "Idea created!"
      redirect_to @brand
    else
      @feed_items = []
      redirect_to @brand
    end
  end

  def destroy
  end

  def show
    @idea = Idea.find(params[:id])
    @brand = Brand.find(@idea.brand_id)
    @user = User.find(@idea.user_id)
  end
end
