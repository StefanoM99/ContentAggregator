class CreateSavedPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :saved_posts do |t|
      t.string :type
      t.string :author
      t.text :title
      t.text :summary
      t.binary :image
      t.binary :video
      t.references :user, null: false, foreign_key: true
      t.references :post, null:false, foreign_key:true
      t.timestamps
    end
    add_index :saved_posts, [:user_id, :post_id, :type], unique: true
  end
end
