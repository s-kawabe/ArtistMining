class RenameImageColumnToArtistImage < ActiveRecord::Migration[5.2]
  def change
    rename_column :artists, :image, :artist_image
  end
end
