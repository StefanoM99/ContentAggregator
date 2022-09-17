class CreateStarredPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :starred_posts do |t|
      t.string :author
      t.text :title
      t.text :summary
      t.binary :image
      t.binary :video

      t.timestamps
    end
  end
end
