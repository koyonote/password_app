class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(:user_id => session[:user_id])
  end

  def create
    unless User.find(session[:user_id]).favorites.where(:item_id => params[:item_id]).first
      @favorite = Favorite.new(:user_id => session[:user_id], :item_id => params[:item_id])
      @favorite.save
    end
    redirect_to(root_url)
  end

  def destroy
    @favorite = Favorite.where(:user_id => session[:user_id], :item_id => params[:item_id]).first
    @favorite.destroy
    redirect_to(root_url)
  end

end
