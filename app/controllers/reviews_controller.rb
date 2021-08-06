class ReviewsController < ApplicationController
  
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
  end

  def review 
    @review = @restaurant.review #estamalo no existe review en restaurant
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
