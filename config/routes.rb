Rails.application.routes.draw do
  
  resources :users, only: [:index, :create, :update, :destroy] do
    resources :tasks, only: [:index, :create, :update, :destroy]
  end 

  get "up" => "rails/health#show", as: :rails_health_check

end
