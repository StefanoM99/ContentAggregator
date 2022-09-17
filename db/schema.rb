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

ActiveRecord::Schema[7.0].define(version: 2022_09_15_211432) do
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

  create_table "comments", force: :cascade do |t|
    t.text "field"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "edited_posts", force: :cascade do |t|
    t.string "author"
    t.text "title"
    t.text "summary"
    t.binary "image"
    t.binary "video"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feeds", force: :cascade do |t|
    t.integer "article_id"
    t.integer "forecast_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_feeds_on_article_id"
    t.index ["forecast_id"], name: "index_feeds_on_forecast_id"
    t.index ["post_id"], name: "index_feeds_on_post_id"
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

  create_table "my_posts", force: :cascade do |t|
    t.string "author"
    t.text "title"
    t.text "summary"
    t.binary "image"
    t.binary "video"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "author"
    t.text "title"
    t.text "summary"
    t.binary "image"
    t.binary "video"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "my_post_id"
    t.integer "edited_post_id"
    t.integer "starred_post_id"
    t.integer "reported_post_id"
    t.integer "starred_article_id"
    t.integer "reported_article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["edited_post_id"], name: "index_profiles_on_edited_post_id"
    t.index ["my_post_id"], name: "index_profiles_on_my_post_id"
    t.index ["reported_article_id"], name: "index_profiles_on_reported_article_id"
    t.index ["reported_post_id"], name: "index_profiles_on_reported_post_id"
    t.index ["starred_article_id"], name: "index_profiles_on_starred_article_id"
    t.index ["starred_post_id"], name: "index_profiles_on_starred_post_id"
  end

  create_table "reported_articles", force: :cascade do |t|
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

  create_table "reported_posts", force: :cascade do |t|
    t.string "author"
    t.text "title"
    t.text "summary"
    t.binary "image"
    t.binary "video"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "starred_articles", force: :cascade do |t|
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

  create_table "starred_posts", force: :cascade do |t|
    t.string "author"
    t.text "title"
    t.text "summary"
    t.binary "image"
    t.binary "video"
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
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "feeds", "articles"
  add_foreign_key "feeds", "forecasts"
  add_foreign_key "feeds", "posts"
  add_foreign_key "profiles", "edited_posts"
  add_foreign_key "profiles", "my_posts"
  add_foreign_key "profiles", "reported_articles"
  add_foreign_key "profiles", "reported_posts"
  add_foreign_key "profiles", "starred_articles"
  add_foreign_key "profiles", "starred_posts"
end
