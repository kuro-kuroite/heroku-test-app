module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def forbidden_login_user
    if current_user
      flash[:danger] = "You've already logged in."
      redirect_to blogs_path
    end
  end

  def before_logged_in
    if !current_user
      flash[:danger] = "You've not logged in yet."
      redirect_to new_session_path
    end
  end
end
