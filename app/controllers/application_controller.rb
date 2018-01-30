class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def forbidden_login_user
    if current_user
      flash[:danger] = "すでにログインしています。"
      redirect_to blogs_path
    end
  end

  def before_logged_in
    unless current_user
      flash[:danger] = "ログインしてください."
      redirect_to new_session_path
    end
  end
end
