class ArtistsController < ApplicationController
  # 1page innner content
  PAGE_CONTENT = 12
  
  def index
    @artists = Artist.all.page(params[:page]).per(PAGE_CONTENT)
  end

  def show
    @show_artist = Artist.find(params[:id])
    @up_user = User.find(@show_artist.user_id)
  end

  def new
  end

  def edit
  end
end
