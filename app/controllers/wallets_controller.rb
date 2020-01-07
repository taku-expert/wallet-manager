class WalletsController < ApplicationController

  def index
    @wallet = Wallet.new
    @wallets = Wallet.all.order("created_at DESC")
    @yellow = Wallet.all.sum(:price)
    @purple = Wallet.find[:]
  end

  def create
    @wallet = Wallet.new(wallet_params)
    @wallet.save
  end

  private
  def wallet_params
    params.require(:wallet).permit(:title, :price, :color)
  end

end
