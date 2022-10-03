class PizzaSerializer < ActiveModel::Serializer
  attributes :id, :name, :ingredients
  # has_many :restaurant_pizzas
end
