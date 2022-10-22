class CreateArticleComments < ActiveRecord::Migration[7.0]
  def change
    create_table :article_comments do |t|
      t.string :author
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true
      t.timestamps
    end
    
  end
end
