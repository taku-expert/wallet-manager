class WalletsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def home
  end

  def index

    @user = User.find(current_user.id)

    @wallet = Wallet.new
    @wallets = Wallet.where(user_id: "#{(current_user.id)}").order("created_at DESC")
    
    @yellow = Wallet.where(user_id: "#{(current_user.id)}").sum(:price)
    
    @purples = Wallet.where(user_id: "#{(current_user.id)}")
    @purple = @purples.where(color: '1').sum(:price)

    @blues = Wallet.where(color: '2')
    @blue = @blues.where(user_id: "(current_user.id)").sum(:price)

    @pinks = Wallet.where(color: '3')
    @pink = @pinks.all.sum(:price)

    @balance = @user.balance
    @par = @yellow / @balance
    @parcent = @par * 100

  end

  def create
    @wallet = Wallet.new(wallet_params)
    @wallet.save
  end

  private
  def wallet_params
    params.require(:wallet).permit(:title, :price, :color)
  end

  def move_to_index
    # redirect_to action: :home unless user_signed_in?
  end


end
