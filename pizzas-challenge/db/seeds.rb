# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
restaurants = Restaurant.create([
    {name: "Star", address: "Nairobi"},
    {name: "Ginger Red", address: "Nairobi"},
    {name: "Mwalimu", address: "Kisii"},
    {name: "Swiss", address: "Kisumu"}
])

pizzas = Pizza.create([
    {name: "Greek Pizza", ingredients: "floor, eggs, coriander"},
    {name: "California Pizza", ingredients: "floor, eggs, coriander"},
    {name: "Detroit Pizza", ingredients: "floor, eggs, coriander"},
    {name: "Chicago Pizza", ingredients: "floor, eggs, coriander"},
])

restaurantpizzas = RestaurantPizza.create([
    {pizza_id: 1, restaurant_id: 1, price: 400},
    {pizza_id: 2, restaurant_id: 2, price: 600},
    {pizza_id: 3, restaurant_id: 3, price: 400},
    {pizza_id: 4, restaurant_id: 4, price: 800}
])