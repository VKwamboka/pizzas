Rails.application.routes.draw do
  resources :restaurants, only: [:index, :show, :destroy]
  resources :restaurant_pizzas, only: [:show,:destroy, :create]
  resources :pizzas, only: [:index, :create]

  # resources :pizzas do
  #   resources :restaurant_pizzas
  # end
end
