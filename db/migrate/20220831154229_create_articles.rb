class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :source
      t.string :author
      t.text :title
      t.text :description
      t.text :summary
      t.text :link
      t.text :media
      t.string :country
      t.string :language
      t.string :topic
      t.string :tw_account
      t.date :publication

      t.timestamps
    end
  end
end
