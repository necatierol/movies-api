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

ActiveRecord::Schema.define(version: 2021_05_08_012443) do

  create_table "content_genres", force: :cascade do |t|
    t.integer "content_id", null: false
    t.integer "genre_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["content_id"], name: "index_content_genres_on_content_id"
    t.index ["genre_id"], name: "index_content_genres_on_genre_id"
  end

  create_table "contents", force: :cascade do |t|
    t.string "item_type"
    t.string "title"
    t.text "description"
    t.string "language"
    t.string "length"
    t.datetime "date"
    t.text "content_info"
    t.integer "pg"
    t.string "url"
    t.string "source"
    t.string "source_url"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "episodes", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "date"
    t.integer "length"
    t.string "url"
    t.string "source"
    t.string "source_url"
    t.boolean "is_active"
    t.integer "season_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["season_id"], name: "index_episodes_on_season_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.string "title"
    t.datetime "date"
    t.boolean "is_active"
    t.integer "content_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["content_id"], name: "index_seasons_on_content_id"
  end

  create_table "user_watch_histories", force: :cascade do |t|
    t.string "status"
    t.integer "time"
    t.integer "content_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["content_id"], name: "index_user_watch_histories_on_content_id"
    t.index ["user_id"], name: "index_user_watch_histories_on_user_id"
  end

  create_table "user_watch_lists", force: :cascade do |t|
    t.integer "content_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["content_id"], name: "index_user_watch_lists_on_content_id"
    t.index ["user_id"], name: "index_user_watch_lists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "content_genres", "contents"
  add_foreign_key "content_genres", "genres"
  add_foreign_key "episodes", "seasons"
  add_foreign_key "seasons", "contents"
  add_foreign_key "user_watch_histories", "contents"
  add_foreign_key "user_watch_histories", "users"
  add_foreign_key "user_watch_lists", "contents"
  add_foreign_key "user_watch_lists", "users"
end
