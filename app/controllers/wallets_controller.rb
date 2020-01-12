class WalletsController < ApplicationController

  before_action :move_to_index, except: :home

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
    # 算出(Calculation) 割合(Percentage) 余り(Remainder)
    @balance = @user.balance
    @yellow_cal = ( @balance.to_f / @yellow ).to_f
    @yellow_per = 100 / @yellow_cal

    # DBが空の場合は計算ができないため結果を"0"として表示
    if @yellow == 0
      @purple_per_total = 0
      @blue_per = 0
      @pink_per = 0
    else
      @purple_cal = ( @yellow.to_f / @purple ).to_f
      @purple_per = 100 / @purple_cal

      @blue_cal = ( @yellow.to_f / @blue ).to_f
      @blue_per = 100 / @blue_cal

      @pink_cal = ( @yellow.to_f / @pink ).to_f
      @pink_per = 100 / @pink_cal

      # 端数分は@purpleに足すこととする。
      @rem = (100 - @purple_per.floor - @blue_per.floor - @pink_per.floor )
      if @purple == 0
        @blue_per = @blue_per + @rem
        @purple_per_total = 0
      else
        @purple_per_total = @purple_per + @rem
      end
    end
  end

  def create
    @wallet = Wallet.new(wallet_params)
    @wallet.save
    redirect_to root_path
  end

  def destroy
    wallet = Wallet.find(params[:id])
    wallet.delete
    redirect_to root_path
  end

  def delete_all
    wallets = Wallet.where(user_id: "#{(current_user.id)}")
    wallets.delete_all
    redirect_to root_path
  end


  def delete_purple
    wallets = Wallet.where(user_id: "#{(current_user.id)}")
    wallet = wallets.where(color: '1')
    wallet.delete_all
    redirect_to root_path
  end

  def delete_blue
    wallets = Wallet.where(user_id: "#{(current_user.id)}")
    wallet = wallets.where(color: '2')
    wallet.delete_all
    redirect_to root_path
  end

  def delete_pink
    wallets = Wallet.where(user_id: "#{(current_user.id)}")
    wallet = wallets.where(color: '3')
    wallet.delete_all
    redirect_to root_path
  end


  private

  def wallet_params
    params.require(:wallet).permit(:title, :price, :color).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :home unless user_signed_in?
  end


end
