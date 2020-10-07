class Artist < ApplicationRecord
  belongs_to :user
  
  has_many :artist_genres, dependent: :destroy
  has_many :get_genres, through: :artist_genres, source: :genre
  accepts_nested_attributes_for :artist_genres

  has_many :artist_feelings, dependent: :destroy
  has_many :get_feelings, through: :artist_feelings, source: :feeling
  accepts_nested_attributes_for :artist_feelings
  
  # ヘッダーの検索ボタンを押した時に動作する
  def self.search(name, genre_ids, feeling_ids)
    ret = []
    ret2 = []
    ret3 = []
    
    if !name.empty?
      ret = Artist.where(['name LIKE ?', "%#{name}%"])
    end
  
    if genre_ids
      ret2 = Genre.genre_registers_search(genre_ids)
    end
  
    if feeling_ids
      ret3 = Feeling.feeling_registers_search(feeling_ids)
    end
    
    return self.ret_check(ret,ret2,ret3)
  end
  
  private
  
  def self.ret_check(ret,ret2,ret3)
    ret_str = []
    
    if !ret.empty?
      ret_str = ret
    end
    
    if !ret2.empty?
      if ret_str.empty?
        ret_str = ret_str | ret2
      else
        ret_str = ret_str & ret2
      end
    end
    
    if !ret3.empty?
      if ret_str.empty?
        ret_str = ret_str | ret3
      else
        ret_str = ret_str & ret3
      end
    end
    
    return ret_str
  end
  
end