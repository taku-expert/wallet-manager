Rails.application.routes.draw do

  devise_for :users
  root to: "wallets#index"

  resources :wallets, only: [:index, :create, :destroy] do
    collection do
      get 'home'
      delete 'delete_purple'
      delete 'delete_blue'
      delete 'delete_pink'
    end
  end

  resources :users, only: [:edit, :update]
  
end