Rails.application.routes.draw do

  devise_for :users
  root to: "wallets#index"

  resources :wallets, only: [:index, :create, :destroy] do
    collection do
      delete 'delete_purple'
      delete 'delete_blue'
      delete 'delete_pink'
      delete 'delete_all'
    end
  end

  resources :users, only: [:edit, :update]
  
end