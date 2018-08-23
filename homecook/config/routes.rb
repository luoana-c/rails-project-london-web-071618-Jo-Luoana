Rails.application.routes.draw do
  resources :users
  resources :ingredients
  resources :recipe_ingredients
  resources :recipes
  resources :order_recipes
  resources :orders

  get "/cooksters/:id", to: 'users#see_cookster', as: 'see_cookster'
  post "/cooksters/:id", to: 'users#see_cookster'
  get "/signup", to: 'users#new', as: 'signup'

  get "/login",     to: 'sessions#new',     as: 'login'
  post "/sessions", to: "sessions#create",  as: 'sessions'
  post "/logout",   to: "sessions#destroy", as: 'logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
