class CreatePlaylistComments < ActiveRecord::Migration[7.0]
  def change
    create_table :playlist_comments do |t|
      t.string :author
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :playlist, null: false, foreign_key: true
      t.timestamps
    end
    add_index :playlist_comments, [:user_id, :playlist_id],unique: true
  end
end
