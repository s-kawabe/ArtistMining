class ArtistFeeling < ApplicationRecord
  belongs_to :artist
  belongs_to :feeling, optional: true
end
