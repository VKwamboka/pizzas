Rails.application.routes.draw do
  resources :restaurants, only: [:index, :show, :destroy, :create]
  resources :restaurant_pizzas, only: [:show,:destroy, :create,:index]
  resources :pizzas, only: [:index, :create]

end
