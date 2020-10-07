class ArtistsController < ApplicationController
  # ページネーションする表示コンテンツ閾値
  PAGE_CONTENT = 12
  
  before_action :genre_feeling_set, only: [:index, :show, :new, :search]
  
  def index
    @artists = Artist.all.order(id: :desc).page(params[:page]).per(PAGE_CONTENT)
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
    @artist = Artist.new
    @artist.artist_genres.build
    @artist.artist_feelings.build
  end
  
  def create
    @artist = Artist.new(artist_params)
    if @artist
      @artist.save!
      redirect_to artist_path(@artist)
    end

    # TODO
    
    # TODO 画像取得追加 
    
    

  end

  def edit
  end
  
  def update
  end
  
  private
  
  def genre_feeling_set 
    @disp_genres = Genre.all
    @disp_feelings = Feeling.all
  end
  
  def artist_params
    params.require(:artist).permit(:name,
                                   :description,
                                   artist_genres_attributes: [:artist_id, :genre_id],
                                   artist_feelings_attributes: [:artist_id, :feeling_id])
                                   .merge(user_id: current_user.id)
  end
end