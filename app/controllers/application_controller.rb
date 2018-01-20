class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def forbidden_login_user
    if current_user
      flash[:danger] = "You've already logged in."
      redirect_to blogs_path
    end
  end

  def before_logged_in
    unless current_user
      flash[:danger] = "You've not logged in yet."
      redirect_to new_session_path
    end
  end
end
