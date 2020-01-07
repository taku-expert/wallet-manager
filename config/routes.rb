Rails.application.routes.draw do

  devise_for :users
  root to: "wallets#home"

  resources :wallets, only: [:index, :create] do
    collection do
      get 'home'
    end
  end
  
end
