class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update, :ensure_correct_user, :blogs, :favorites]
  before_action :forbidden_login_user, only:[:new, :create]
  before_action :ensure_correct_user, only:[:edit, :update]

  def new
    @user = User.new
    render layout: 'top_page'
  end

  def create
    @user = User.new(users_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録に成功しました。"
      redirect_to blogs_path
    else
      render 'new'
    end
  end

    PER = 5

  def show
    @user_blogs = @user.blogs.page(params[:page]).per(PER).reverse_order
    @favorite_blogs = @user.favorite_blogs.page(params[:page]).per(PER).reverse_order
  end

  def blogs
  end

  def favorites
  end

  def edit
  end

  def update
    if @user.update(users_params)
      flash[:notice] = "ユーザー情報を更新しました。"
      redirect_to user_path(@user.id)
    else
      render "edit"
    end
  end

  private
    def users_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def ensure_correct_user
      if current_user.id != @user.id.to_i
        flash[:danger] = "権限がありません。"
        redirect_to user_path(@user.id)
      end
    end
end
