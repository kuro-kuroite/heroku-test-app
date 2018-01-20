class FavoritesController < ApplicationController
  def create
    current_user.favorites.create(blog_id: params[:blog_id])
    redirect_to blog_path(params[:blog_id])
  end

  def destroy
    current_user.favorites.find_by(blog_id: params[:blog_id]).destroy
    redirect_to blog_path(params[:blog_id])
  end
end
