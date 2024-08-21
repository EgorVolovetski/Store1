Rails.application.routes.draw do
  #devise_for :users
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'users/show'
  get 'home/show'
  root 'home#index'
  get "up" => "rails/health#show", as: :rails_health_check
  resource :profile, only: [:new, :create, :show, :edit, :update]

end
