class RestaurantsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :create_error

     # GET /restaurant
  def index
    restaurants = Restaurant.all
    render json: restaurants
  end

  # GET /restaurant/:id
  def show
    restaurant = find_restaurant
    render json: restaurant, include: :pizzas
  end

  # create restaurant
  def create
    respizza = Restaurant.create!(restaurant_param)
    render json: respizza,  status: 201
  end

  # destroy restaurant
  def destroy
    restaurant = find_restaurant
    restaurant.destroy
    head :no_content
  end

  private 

  def find_restaurant
    Restaurant.find(params[:id])
  end
  
  def render_not_found_response
    render json: { error: "Restaurant not found" }, status: 404
  end

  def create_error
    render json: { error:  ["validation errors"]}, status: 422
  end

  def restaurant_param
    params.permit(:name, :address)
  end

end
