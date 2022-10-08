class CreateSavedPlaylists < ActiveRecord::Migration[7.0]
  def change
    create_table :saved_playlists do |t|
      t.string :type
      t.string :country
      t.string :name
      t.text :description
      t.text :spotify_url
      t.text :spotify_img
      t.text :tracks, array: true
      t.references :user, null: false, foreign_key: true
      t.references :playlist, null:false, foreign_key:true
      t.timestamps
    end
    add_index :saved_playlists, [:user_id, :playlist_id],unique: true
  end
end
