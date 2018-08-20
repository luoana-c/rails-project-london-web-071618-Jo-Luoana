Rails.application.routes.draw do
  resources :ingredients
  resources :recipe_ingredients
  resources :recipes
  resources :order_recipes
  resources :foodsters
  resources :orders
  resources :cooksters
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
