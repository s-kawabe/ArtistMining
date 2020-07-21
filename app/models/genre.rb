class Genre < ApplicationRecord
  has_many :artist_genres
  has_many :this_genre_registers, through: :artist_genres, source: :artist
end
