class CreateSavedArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :saved_articles do |t|
      t.string :type
      t.string :country
      t.string :category
      t.string :source
      t.string :author
      t.text :title
      t.text :description
      t.text :summary
      t.text :link
      t.text :media
      t.date :publication
      t.references :user, null: false, foreign_key: true
      t.references :article, null:false, foreign_key:true
      t.timestamps
    end
    add_index :saved_articles, [:user_id, :article_id], unique: true
  end
end
