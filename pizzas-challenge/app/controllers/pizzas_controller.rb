class PizzasController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :create_error

# GET /pizzas
  def index
    pizzas = Pizza.all
    render json: pizzas
  end

  # create pizza
  def create
    pizza = Pizza.create(pizza_params)
    render json: pizza, status: 201
  end

  private 
  
  def pizza_params
    params.permit(:name, :ingredients)
  end

  def find_restaurantpizza
    Pizza.find(params[:id])
  end
  
  def render_not_found_response
    render json: { error: "Pizza not found" }, status: 404
  end

  def create_error
    render json: { error:  ["validation errors"]}, status: 422
  end


end
