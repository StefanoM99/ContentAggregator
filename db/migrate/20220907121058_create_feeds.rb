class CreateFeeds < ActiveRecord::Migration[7.0]
  def change
    create_table :feeds do |t|
      t.belongs_to :article, index: true, foreign_key: true
      t.belongs_to :forecast, index: true, foreign_key: true
      t.belongs_to :post, index: true, foreign_key: true
      t.timestamps
    end
  end
end
