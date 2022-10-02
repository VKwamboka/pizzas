class RestaurantPizza < ApplicationRecord
    
    # must have a `price` between 1 and 30
    validates :price, numericality: { in: 0..30}

    belongs_to :restaurant
    belongs_to :pizza
    
end
