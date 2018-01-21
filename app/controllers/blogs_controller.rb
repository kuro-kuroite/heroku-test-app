class BlogsController < ApplicationController
  before_action :set_blog, only:[:show, :edit, :update, :destroy, :edit_confirm, :ensure_correct_post]
  before_action :before_logged_in
  before_action :ensure_correct_post, only:[:edit, :update]

  PER = 10

  def index
    @blogs = Blog.page(params[:page]).per(PER).reverse_order
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  def create
    @blog = current_user.blogs.new(blog_params)
    if @blog.save
      flash[:notice] = "Created new blog \"#{@blog.title}\"."
      redirect_to blogs_path
    else
      render "new"
    end
  end

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def edit
    if params[:back]
      @blog.attributes = blog_params
    end
  end

  def update
    if @blog.update(blog_params)
      flash[:notice] = "Edited blog \"#{@blog.title}\"."
      redirect_to blogs_path
    else
      render "edit"
    end
  end

  def destroy
    @blog.destroy
    flash[:notice] = "Deleted blog \"#{@blog.title}\"."
    redirect_to blogs_path
  end

  def new_confirm
    @blog = current_user.blogs.new(blog_params)
    render "new" unless @blog.valid?
  end

  def edit_confirm
    @blog.attributes = blog_params
    render "edit" unless @blog.valid?
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def ensure_correct_post
    if current_user.id != @blog.user_id.to_i
      flash[:danger] = "Unauthorized access."
      redirect_to blog_path(@blog.id)
    end
  end
end
