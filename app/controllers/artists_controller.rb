class ArtistsController < ApplicationController
  # ページネーションする表示コンテンツ閾値
  PAGE_CONTENT = 12
  
  before_action :genre_feeling_set, only: [:index, :show, :new, :search]
  
  def index
    @artists = Artist.all.page(params[:page]).per(PAGE_CONTENT)
  end
  
  def search
    # 検索機能 
    artist_name = params[:name]
    genre_ids = params[:genres]      
    feeling_ids = params[:feelings]  
    
    if artist_name.empty? && genre_ids.nil? && feeling_ids.nil?
      flash[:danger] = '検索条件を指定してください。'
      redirect_to root_path
    end
    
    @search_results = Artist.search(artist_name, genre_ids, feeling_ids)
  end

  def show
    @show_artist = Artist.find(params[:id])
    @up_user = User.find(@show_artist.user_id)
  end

  def new
  end

  def edit
  end
  
  private
  
  def genre_feeling_set 
    @disp_genres = Genre.all
    @disp_feelings = Feeling.all
  end

end