class RestaurantsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @restaurants = Restaurant.all
  end

  def new
    # @restaurant = Restaurant.new
    # user = User.first(email: params[:email])

    if !user_signed_in?
      flash[:notice] = "Cannot add restaurant: you must be logged in"
    else
      @restaurant = Restaurant.new
    end
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path
    else
      render 'new'
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)

    redirect_to '/restaurants'
  end

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    if current_user.has_restaurant? @restaurant
      @restaurant.destroy
      flash[:notice] = "#{@restaurant.name} has been deleted"
      redirect_to '/restaurants'
    else
      redirect_to '/restaurants'
      flash[:notice] = "You cannot delete this restaurant"
    end
  end
end
