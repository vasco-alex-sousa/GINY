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

ActiveRecord::Schema[7.0].define(version: 2023_03_08_162013) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "box_art_url"
    t.integer "rank"
    t.integer "average_viewers"
    t.integer "peak_viewers"
    t.date "peak_viewers_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clips", force: :cascade do |t|
    t.string "thumbnail_url"
    t.bigint "stream_id", null: false
    t.string "title"
    t.integer "view_count"
    t.time "clip_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stream_id"], name: "index_clips_on_stream_id"
  end

  create_table "streams", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.datetime "started_at"
    t.string "language"
    t.string "status"
    t.integer "viewer_count"
    t.integer "average_viewers"
    t.integer "peak_viewers"
    t.integer "number_of_chat_messages"
    t.integer "unique_chatters"
    t.integer "new_followers"
    t.integer "new_subscriptions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_streams_on_category_id"
    t.index ["user_id"], name: "index_streams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "display_name"
    t.string "profile_image_url"
    t.text "description"
    t.integer "total_followers"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "clips", "streams"
  add_foreign_key "streams", "categories"
  add_foreign_key "streams", "users"
end
