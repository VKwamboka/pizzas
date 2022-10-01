class AddPizzaToRestaurantPizza < ActiveRecord::Migration[7.0]
  def change
    add_reference :restaurant_pizzas, :pizza, null: false, foreign_key: true
  end
end
