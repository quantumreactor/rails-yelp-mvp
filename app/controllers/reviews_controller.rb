class ReviewsController < ApplicationController

  before_action :find_restaurant, except: [ :create, :new]
  
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'restaurants/show'
    end
  end

  #def review 
  #  @review = @restaurant.review #estamalo no existe review en restaurant
  #end

  def destroy
    find_restaurant
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@restaurant)
  end
  
  private
  
  def review_params
    params.require(:review).permit(:content, :rating)
  end
  
  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
