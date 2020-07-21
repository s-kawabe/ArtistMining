class Artist < ApplicationRecord
  belongs_to :user
  
  has_many :artist_feelings
  has_many :get_feelings, through: :artist_feelings, source: :feeling
  
  has_many :artist_genres
  has_many :get_genres, through: :artist_genres, source: :genre
end