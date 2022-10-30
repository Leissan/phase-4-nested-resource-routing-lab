Rails.application.routes.draw do
  
  resources :users, only: [:show] do
    resources :items, only: [:show, :index, :create] #routes for nested resources
  end

  resources :items, only: [:show, :index, :create] #anything non-nested
end
