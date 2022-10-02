class RestaurantsController < ApplicationController
     # GET /restaurant
  def index
    restaurants = Restaurant.all
    render json: restaurants
  end

  # GET /restaurant/:id
  def show
    restaurant = Restaurant.find_by(id: params[:id])
    if restaurant
      render json: restaurant, include: :pizzas
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end
end
