class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  # ログイン済ユーザーのみにアクセスを許可
  before_action :authenticate_user!
  # gem devise関連の遷移を行った際
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :balance])
  end

end
