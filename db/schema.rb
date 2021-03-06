# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_26_032820) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "comment_reports", force: :cascade do |t|
    t.integer "comment_id", null: false
    t.text "report", null: false
    t.integer "status", default: 0, null: false
    t.text "correspondence"
    t.integer "reason", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "game_id", null: false
    t.text "comment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.text "contact_text", null: false
    t.text "answer"
    t.string "email", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0, null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_models", force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "model_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_reports", force: :cascade do |t|
    t.integer "game_id", null: false
    t.text "report", null: false
    t.integer "status", default: 0, null: false
    t.text "correspondence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "reason", null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "genre_id", null: false
    t.text "title", null: false
    t.date "release", null: false
    t.integer "number_of_people", null: false
    t.text "text", null: false
    t.boolean "complete", null: false
    t.boolean "orbit", null: false
    t.boolean "multi_ending", null: false
    t.integer "cero_rating", null: false
    t.text "site_url"
    t.boolean "status", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_games_on_title", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: true, null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.integer "status", default: 0, null: false
    t.integer "report_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["name"], name: "index_members_on_name", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "models", force: :cascade do |t|
    t.string "model", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playtimes", force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "member_id"
  end

  create_table "warning_mails", force: :cascade do |t|
    t.integer "member_id", null: false
    t.text "warning_text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
