class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :mail
      t.string :password
      t.string :name
      t.string :surname

      t.timestamps
    end
  end
end
