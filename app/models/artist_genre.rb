class ArtistGenre < ApplicationRecord
  belongs_to :artist
  belongs_to :genre, optional: true
end
