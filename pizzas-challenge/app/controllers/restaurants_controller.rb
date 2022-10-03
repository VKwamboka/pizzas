class RestaurantsController < ApplicationController
     # GET /restaurant
  def index
    restaurants = Restaurant.all
    render json: restaurants
  end

  # GET /restaurant/:id
  def show
    restaurant = find_restaurant
    if restaurant
      render json: restaurant, include: :pizzas
    else
      not_found
    end
  end

  # destroy restaurant
  def destroy
    restaurant = find_restaurant
    if restaurant
      restaurant.destroy
      head :no_content
      else
        not_found
    end
  
  end

  private 

  def find_restaurant
    Restaurant.find_by(id: params[:id])
  end
  
  def not_found
    render json: { error: "Restaurant not found" }, status: 404
  end

end
