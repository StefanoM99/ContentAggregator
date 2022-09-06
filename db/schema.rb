# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_05_201443) do
  create_table "articles", force: :cascade do |t|
    t.string "country"
    t.string "category"
    t.string "source"
    t.string "author"
    t.text "title"
    t.text "description"
    t.text "summary"
    t.text "link"
    t.text "media"
    t.date "publication"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forecasts", force: :cascade do |t|
    t.string "place"
    t.float "lat"
    t.float "lon"
    t.string "weather"
    t.string "description"
    t.string "icon"
    t.float "temp"
    t.float "temp_min"
    t.float "temp_max"
    t.integer "pressure"
    t.integer "humidity"
    t.integer "sea_level"
    t.integer "grnd_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "mail"
    t.string "password"
    t.string "name"
    t.string "surname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
