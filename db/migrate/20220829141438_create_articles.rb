class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :source
      t.string :author
      t.text :title
      t.text :description
      t.text :url
      t.text :image_url
      t.date :publication

      t.timestamps
    end
  end
end
