class CreateForecasts < ActiveRecord::Migration[7.0]
  def change
    create_table :forecasts do |t|
      t.belongs_to :feed, index: true, foreign_key: true
      
      t.string :place
      t.float :lat
      t.float :lon
      t.string :weather
      t.string :description
      t.string :icon
      t.float :temp
      t.float :temp_min
      t.float :temp_max
      t.integer :pressure
      t.integer :humidity
      t.integer :sea_level
      t.integer :grnd_level

      t.timestamps
    end
  end
end
