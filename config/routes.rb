Rails.application.routes.draw do
  devise_for :businesses
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :vouchers, only: [:index, :create, :show, :update, :destroy] do
    collection do
      delete 'bulk_destroy'
    end
    member do
      post 'email_voucher'
    end
  end
  resources :units, only: [:index, :create, :destroy]
  resources :businesses, only: [:show, :update]
end
