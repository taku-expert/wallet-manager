class WalletsController < ApplicationController

  def index
    @wallet = Wallet.new
    @wallets = Wallet.all.order("created_at DESC")
    
    @yellow = Wallet.all.sum(:price)
    
    @purples = Wallet.where(color: '1')
    @purple = @purples.all.sum(:price)

    @blues = Wallet.where(color: '2')
    @blue = @blues.all.sum(:price)

    @pinks = Wallet.where(color: '3')
    @pink = @pinks.all.sum(:price)
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
