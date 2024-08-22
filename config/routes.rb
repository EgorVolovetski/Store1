Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    delete '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'users/show'
  get 'home/show'
  root 'home#index'
  get "up" => "rails/health#show", as: :rails_health_check

  resource :profile, only: [:new, :create, :show, :edit, :update]

  resources :products
  resources :categories

  # Adding routes for carts and cart items
  resource :cart, only: [:show] do
    post 'add_product/:product_id', to: 'carts#add_product', as: 'add_product'
    delete 'remove_product/:product_id', to: 'carts#remove_product', as: 'remove_product'
  end

  resources :cart_items, only: [:update]
end
