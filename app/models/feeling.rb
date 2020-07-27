class Feeling < ApplicationRecord
  has_many :artist_feelings
  has_many :this_feeling_registers, through: :artist_feelings, source: :artist
  
  def self.feeling_registers_search(feeling_ids)
    
    # idが1つの場合
    if feeling_ids.length == 1
      # そのidのfeelingを持つArtist一覧を返す
      return Feeling.find(feeling_ids[0]).this_feeling_registers
    # idが複数
    else
      feelings = Feeling.find(feeling_ids)
      artists = {} 
      results = []
      feelings.each_with_index do |feeling,i|
        artists[i] = feeling.this_feeling_registers
        if i != 0
          results = artists[i-1] & artists[i]
        end
      end
      
      return results
    end
  end
end
