class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.belongs_to :feed, index: true, foreign_key: true

      t.string :author
      t.text :title
      t.text :summary
      t.binary :image
      t.binary :video
      
      t.timestamps
    end
  end
end
