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

ActiveRecord::Schema[7.0].define(version: 2022_09_25_133548) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.integer "feed_id"
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
    t.index ["feed_id"], name: "index_articles_on_feed_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "field"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feeds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forecasts", force: :cascade do |t|
    t.integer "feed_id"
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
    t.index ["feed_id"], name: "index_forecasts_on_feed_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string "country"
    t.string "name"
    t.text "description"
    t.text "spotify_url"
    t.text "spotify_img"
    t.text "tracks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "feed_id"
    t.string "author"
    t.text "title"
    t.text "summary"
    t.binary "image"
    t.binary "video"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feed_id"], name: "index_posts_on_feed_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "saved_articles", force: :cascade do |t|
    t.string "type"
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

  create_table "saved_playlists", force: :cascade do |t|
    t.string "type"
    t.string "country"
    t.string "name"
    t.text "description"
    t.text "spotify_url"
    t.text "spotify_img"
    t.text "tracks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "saved_posts", force: :cascade do |t|
    t.string "type"
    t.string "author"
    t.text "title"
    t.text "summary"
    t.binary "image"
    t.binary "video"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name", default: "", null: false
    t.string "surname"
    t.string "full_name"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.string "avatar_url"
    t.string "provider"
    t.string "uid"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "articles", "feeds"
  add_foreign_key "forecasts", "feeds"
  add_foreign_key "posts", "feeds"
end
