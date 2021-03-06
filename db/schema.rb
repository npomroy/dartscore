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

ActiveRecord::Schema.define(version: 20161228211512) do

  create_table "games", force: :cascade do |t|
    t.boolean  "team1_up"
    t.integer  "starting_score"
    t.boolean  "playing",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team1_id"
    t.integer  "team2_id"
    t.string   "name"
  end

  create_table "players", force: :cascade do |t|
    t.string  "name"
    t.boolean "is_away",   default: false
    t.string  "gamestats"
    t.integer "best_shot", default: 0
    t.integer "team_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "contact_email"
    t.text     "description"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "shots", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.integer  "darts"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "start_score"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "score"
    t.integer  "current_shooter", default: 0
    t.boolean  "is_away",         default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "game_id"
    t.integer  "player_ids"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
