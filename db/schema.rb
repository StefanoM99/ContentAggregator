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

ActiveRecord::Schema[7.0].define(version: 2022_10_25_113312) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
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
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "article_comments", force: :cascade do |t|
    t.string "author"
    t.text "description"
    t.integer "user_id", null: false
    t.integer "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_comments_on_article_id"
    t.index ["user_id"], name: "index_article_comments_on_user_id"
  end

  create_table "articles", force: :cascade do |t|
    t.integer "feed_id"
    t.integer "user_id"
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
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "blacklists", force: :cascade do |t|
    t.text "spotify_url"
    t.string "name"
    t.text "title"
    t.text "description"
    t.text "summary"
    t.text "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feeds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followee_id"
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

  create_table "playlist_comments", force: :cascade do |t|
    t.string "author"
    t.text "description"
    t.integer "user_id", null: false
    t.integer "playlist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["playlist_id"], name: "index_playlist_comments_on_playlist_id"
    t.index ["user_id"], name: "index_playlist_comments_on_user_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.integer "feed_id"
    t.integer "user_id"
    t.string "country"
    t.string "name"
    t.text "description"
    t.text "spotify_url"
    t.text "spotify_img"
    t.text "tracks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feed_id"], name: "index_playlists_on_feed_id"
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end

  create_table "post_comments", force: :cascade do |t|
    t.string "author"
    t.text "description"
    t.integer "user_id", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_comments_on_post_id"
    t.index ["user_id"], name: "index_post_comments_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "feed_id"
    t.integer "user_id"
    t.string "author"
    t.text "title"
    t.text "summary"
    t.string "post_file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feed_id"], name: "index_posts_on_feed_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
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
    t.integer "user_id", null: false
    t.integer "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_saved_articles_on_article_id"
    t.index ["user_id", "article_id", "type"], name: "index_saved_articles_on_user_id_and_article_id_and_type", unique: true
    t.index ["user_id"], name: "index_saved_articles_on_user_id"
  end

  create_table "saved_playlists", force: :cascade do |t|
    t.string "type"
    t.string "country"
    t.string "name"
    t.text "description"
    t.text "spotify_url"
    t.text "spotify_img"
    t.text "tracks"
    t.integer "user_id", null: false
    t.integer "playlist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["playlist_id"], name: "index_saved_playlists_on_playlist_id"
    t.index ["user_id", "playlist_id", "type"], name: "index_saved_playlists_on_user_id_and_playlist_id_and_type", unique: true
    t.index ["user_id"], name: "index_saved_playlists_on_user_id"
  end

  create_table "saved_posts", force: :cascade do |t|
    t.string "type"
    t.string "author"
    t.text "title"
    t.text "summary"
    t.string "post_file"
    t.integer "user_id", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_saved_posts_on_post_id"
    t.index ["user_id"], name: "index_saved_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name", default: "", null: false
    t.string "surname"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.string "avatar_url"
    t.string "provider"
    t.string "uid"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.datetime "reset_password_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "article_comments", "articles"
  add_foreign_key "article_comments", "users"
  add_foreign_key "articles", "feeds"
  add_foreign_key "articles", "users"
  add_foreign_key "forecasts", "feeds"
  add_foreign_key "playlist_comments", "playlists"
  add_foreign_key "playlist_comments", "users"
  add_foreign_key "playlists", "feeds"
  add_foreign_key "playlists", "users"
  add_foreign_key "post_comments", "posts"
  add_foreign_key "post_comments", "users"
  add_foreign_key "posts", "feeds"
  add_foreign_key "posts", "users"
  add_foreign_key "saved_articles", "articles"
  add_foreign_key "saved_articles", "users"
  add_foreign_key "saved_playlists", "playlists"
  add_foreign_key "saved_playlists", "users"
  add_foreign_key "saved_posts", "posts"
  add_foreign_key "saved_posts", "users"
end
