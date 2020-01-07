class WalletsController < ApplicationController

  def index
    @wallet = Wallet.new
    @wallets = Wallet.all
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
