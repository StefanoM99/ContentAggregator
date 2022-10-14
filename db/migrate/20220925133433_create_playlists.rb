class CreatePlaylists < ActiveRecord::Migration[7.0]
  def change
    create_table :playlists do |t|
      
      t.string :country
      t.string :name
      t.text :description
      t.text :spotify_url
      t.text :spotify_img
      t.text :tracks, array: true

      t.timestamps
    end
  end
end
