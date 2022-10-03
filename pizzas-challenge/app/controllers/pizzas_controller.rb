class PizzasController < ApplicationController
# GET /restaurant
  def index
    pizzas = Pizza.all
    render json: pizzas
  end

  def create
    pizza = Pizza.create(pizza_params)
    render json: pizza, status: 201
  end

  private 
  
  def pizza_params
    params.permit(:name, :ingredients)
  end

end
