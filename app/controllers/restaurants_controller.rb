# documenatation
class RestaurantsController < ApplicationController
  # Las 7 rutas: show, index, new, create, edit, update y destroy
  #before_action :select_restaurant #, only: %i(show edit update destroy)
  before_action :find_restaurant, except: [ :index ]

  def index
    @restaurants = Restaurant.all
  end

  def show
    
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
  
  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
