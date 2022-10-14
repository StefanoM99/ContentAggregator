class CreateSavedPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :saved_posts do |t|
      t.string :type
      t.string :author
      t.text :title
      t.text :summary
      t.string :post_file
      t.references :user, null: false, foreign_key: true
      t.references :post, null:false, foreign_key:true
      t.timestamps
    end
    
  end
end
