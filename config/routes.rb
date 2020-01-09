Rails.application.routes.draw do

  devise_for :users
  root to: "wallets#index"

  resources :wallets, only: [:index, :create] do
    collection do
      get 'home'
    end
  end

  resources :users, only: [:edit, :update]
  
end
