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

ActiveRecord::Schema.define(version: 2021_04_15_150833) do

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

  add_foreign_key "episodes", "seasons"
  add_foreign_key "seasons", "contents"
end
