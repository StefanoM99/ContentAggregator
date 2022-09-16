class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.belongs_to :my_post, index: true, foreign_key: true
      t.belongs_to :edited_post, index: true, foreign_key: true
      t.belongs_to :starred_post, index: true, foreign_key: true
      t.belongs_to :reported_post, index: true, foreign_key: true
      
      t.belongs_to :starred_article, index: true, foreign_key: true
      t.belongs_to :reported_article, index: true, foreign_key: true
      t.timestamps
    end
  end
end
