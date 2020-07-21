class CreateArtistFeelings < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_feelings do |t|
      t.references :artist, foreign_key: true
      t.references :feeling, foreign_key: true

      t.timestamps
    end
  end
end
