Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :dish, only: [:index, :show, :new, :create, :edit, :update]
  resources :chef, only: [:index, :show]
end
