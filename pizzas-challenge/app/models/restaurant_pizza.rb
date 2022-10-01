class RestaurantPizza < ApplicationRecord
    belongs_to :restaurant
    belongs_to :pizzas
    

end
