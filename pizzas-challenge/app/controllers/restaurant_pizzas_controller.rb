class RestaurantPizzasController < ApplicationController

  def show
    restaurantpizza = find_restaurantpizza
    if restaurantpizza
      render json: restaurantpizza, include: :pizzas
    else
      not_found
    end
  end
  
    def destroy
        restaurantpizza = find_restaurantpizza
        restaurantpizza.destroy
        head :no_content
    end

    def create
      respizza = RestaurantPizza.create!(restaurantpizza_params)
      if respizza
        render json: respizza,  status: 201
      else
        render json: { error:  ["validation errors"]}, status: 422
      end
      
    end

    private 

    def find_restaurantpizza
      RestaurantPizza.find(params[:id])
    end
    
    def not_found
      render json: { error: "Restaurant not found" }, status: 404
    end

    def restaurantpizza_params
      params.permit(:price, :pizza_id, :restaurant_id)
    end
end
