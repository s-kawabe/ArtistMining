class FavoritesController < ApplicationController

  before_action :set_artist, only: [:create, :destroy]

  def create
    current_user.favorite(@artist)
    flash[:success] = 'お気に入りに登録しました'
  end

  def destroy
    current_user.unfavorite(@artist)
    flash[:success] = 'お気に入りを解除しました'
  end

  private
  
  def set_artist 
    @artist = Artist.find(params[:artist_id])
    @show_artist = Artist.find(params[:artist_id]) 
  end
end
