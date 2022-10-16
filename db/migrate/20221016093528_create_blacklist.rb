class CreateBlacklist < ActiveRecord::Migration[7.0]
  def change
    create_table :blacklists do |t|
      t.text :spotify_url
      t.string :name
      t.text :title
      t.text :description
      t.text :summary
      t.text :tipo
      t.timestamps
    end
  end
end
