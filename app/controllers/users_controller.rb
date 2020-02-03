class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update]


  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :balance)
  end

  def set_user
    @user = User.find(current_user.id)
  end

end
