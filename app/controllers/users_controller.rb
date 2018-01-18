class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update]
  before_action :forbidden_login_user, only:[:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You've signed up!"
      redirect_to blogs_path
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(users_params)
      flash[:notice] = "You've edited your profile!"
      redirect_to user_path(@user.id)
    else
      render "edit"
    end
  end

  private
    def users_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
