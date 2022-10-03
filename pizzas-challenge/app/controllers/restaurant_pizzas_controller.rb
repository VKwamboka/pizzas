class RestaurantPizzasController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :create_error

  # get all restaurant pizzas
  def index
    restaurantspiz = RestaurantPizza.all
    render json: restaurantspiz
  end

  # GET /restaurantpizzas/:id
  def show
    restaurantpizza = find_restaurantpizza
    render json: restaurantpizza
  end
  
  # delete restaurantpizza
  def destroy
      restaurantpizza = find_restaurantpizza
      restaurantpizza.destroy
      head :no_content
  end
  
  # create restaurantpizza
  def create
    respizza = RestaurantPizza.create!(restaurantpizza_param)
    render json: respizza,  status: 201
  end

  private 

  def find_restaurantpizza
    RestaurantPizza.find(params[:id])
  end
  
  def render_not_found_response
    render json: { error: "Restaurant pizza not found" }, status: 404
  end

  def create_error
    render json: { error:  ["validation errors"]}, status: 422
  end

  def restaurantpizza_param
    params.permit(:price, :pizza_id, :restaurant_id)
  end
end
