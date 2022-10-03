class Pizza < ApplicationRecord
    has_many :restaurant_pizzas
    # , Serializer: restaurant_pizza_serializer
    has_many :restaurants, through: :restaurant_pizzas
    
end
