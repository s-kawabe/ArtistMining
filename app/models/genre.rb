class Genre < ApplicationRecord
  has_many :artist_genres
  has_many :this_genre_registers, through: :artist_genres, source: :artist

  def self.genre_registers_search(genre_ids)
    
    # idが1つの場合
    if genre_ids.length == 1
      # そのidのgenreを持つArtist一覧を返す
      return Genre.find(genre_ids[0]).this_genre_registers
    # idが複数
    else
      genres = Genre.find(genre_ids)
      artists = {} # それぞれのgenreを持つartist
      results = []
      genres.each_with_index do |genre,i|
        artists[i] = genre.this_genre_registers
        if i != 0
          results = artists[i-1] & artists[i]
        end
      end
      
      return results
    end
  end
end
