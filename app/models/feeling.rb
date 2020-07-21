class Feeling < ApplicationRecord
  has_many :artist_feelings
  has_many :this_feeling_registers, through: :artist_feelings, source: :artist
end
