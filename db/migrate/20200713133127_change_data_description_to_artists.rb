class ChangeDataDescriptionToArtists < ActiveRecord::Migration[5.2]
  def change
    change_column :artists, :description, :text
  end
end
