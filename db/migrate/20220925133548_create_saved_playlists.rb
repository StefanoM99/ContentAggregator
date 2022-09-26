class CreateSavedPlaylists < ActiveRecord::Migration[7.0]
  def change
    create_table :saved_playlists do |t|
      t.string :type
      t.string :country
      t.string :name
      t.text :description
      t.text :spotify_url
      t.text :spotify_img

      t.timestamps
    end
  end
end
