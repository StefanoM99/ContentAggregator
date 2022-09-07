class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :author
      t.text :title
      t.text :summary

      t.timestamps
    end
  end
end
