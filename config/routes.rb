Rails.application.routes.draw do
  devise_for :businesses
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :vouchers, only: [:index, :create]
  resources :units, only: [:index, :create]
end
