class RemoveGenreFromArtists < ActiveRecord::Migration[5.2]
  def change
    remove_column :artists, :genre, :string
  end
end
