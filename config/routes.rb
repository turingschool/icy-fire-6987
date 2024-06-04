Rails.application.routes.draw do
  resources :dishes do
    resources :ingredients
    resources :dish_ingredients, only: [:create]
  end

  resources :chefs
  
end
