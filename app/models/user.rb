class User < ApplicationRecord

  mount_uploader :user_image, UserImageUploader

  before_save { self.email.downcase! }
  validates :name, presence: true
  validates :name, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/ },
                    uniqueness: { case_sensitive: false }
                    
  has_secure_password
    
  has_many :artists

  has_many :favorites
  has_many :favoritings, through: :favorites, source: :artist

  def favorite(artist)
    self.favorites.find_or_create_by(artist_id: artist.id)
  end

  def unfavorite(artist)
    favorite = self.favorites.find_by(artist_id: artist.id)
    favorite.destroy if favorite
  end

  def favoriting?(artist)
    self.favoritings.include?(artist)
  end
end
