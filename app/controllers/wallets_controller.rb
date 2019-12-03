class WalletsController < ApplicationController

  def index
    @wallet = Wallet.new
    @wallets = Wallet.all
  end

  def create
    Wallet.create(wallet_params)
  end

  private
  def wallet_params
    params.require(:wallet).permit(:title)
  end

end
