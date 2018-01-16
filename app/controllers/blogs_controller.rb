class BlogsController < ApplicationController
  before_action :find_blog_by_id, only:[:show, :edit, :update, :destroy, :edit_confirm]

  def index
    @blogs = Blog.all.order(created_at: :desc)
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: "Created new blog \"#{@blog.title}\"."
    else
      render "new"
    end
  end

  def show
  end

  def edit
    if params[:back]
      @blog.attributes = blog_params
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "Edited blog \"#{@blog.title}\"."
    else
      render "edit"
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "Deleted blog \"#{@blog.title}\"."
  end

  def new_confirm
    @blog = Blog.new(blog_params)
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

  def find_blog_by_id
    @blog = Blog.find(params[:id])
  end
end
