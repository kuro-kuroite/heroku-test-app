class SessionsController < ApplicationController
  before_action :forbidden_login_user, only:[:new, :create]
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "You've loged in."
      redirect_to blogs_path
    else
      flash[:danger] = "You've failed to log in."
      redirect_to new_session_path
    end
  end

  def destroy
     session.delete(:user_id)
     flash[:notice] = "You've logged out."
     redirect_to root_path
  end
end
