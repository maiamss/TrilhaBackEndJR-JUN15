Rails.application.routes.draw do
  resources :tasks, only: [:index, :create, :update, :destroy]
  resources :users, only: [:index, :create, :update, :destroy]
  
  get "up" => "rails/health#show", as: :rails_health_check


end
