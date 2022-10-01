class AddRestaurantToRestaurantPizza < ActiveRecord::Migration[7.0]
  def change
    add_reference :restaurant_pizzas, :restaurant, null: false, foreign_key: true
  end
end
