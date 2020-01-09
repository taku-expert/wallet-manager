class WalletsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def home
  end

  def index

    @user = User.find(current_user.id)

    @wallet = Wallet.new
    @wallets = Wallet.where(user_id: "#{(current_user.id)}").order("created_at DESC")

    # 各色によって分けられたそれぞれの金額の合計
    @yellow = @wallets.sum(:price)
    @purple = @wallets.where(color: '1').sum(:price)
    @blue = @wallets.where(color: '2').sum(:price)
    @pink = @wallets.where(color: '3').sum(:price)

    # ( 設定された残高 / 入力金額の総合計 ) をして割合を算出
    @balance = @user.balance
    @calculation = ( @balance.to_f / @yellow ).to_f
    @percentage = 100 / @calculation

  end

  def create
    @wallet = Wallet.new(wallet_params)
    @wallet.save
  end

  private
  def wallet_params
    params.require(:wallet).permit(:title, :price, :color).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :home unless user_signed_in?
  end


end
