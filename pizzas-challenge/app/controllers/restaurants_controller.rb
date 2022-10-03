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
    Restaurant.find(params[:id])
  end
  
  def render_not_found_response
    render json: { error: "Pizza not found" }, status: 404
  end

  def create_error
    render json: { error:  ["validation errors"]}, status: 422
  end

end
