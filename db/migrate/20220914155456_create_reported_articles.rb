class CreateReportedArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :reported_articles do |t|
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

      t.timestamps
    end
  end
end
