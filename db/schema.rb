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

ActiveRecord::Schema.define(version: 2019_10_28_165851) do

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "number"
    t.integer "team_id"
    t.integer "position_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["position_id"], name: "index_players_on_position_id"
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slots_jwt_sessions", force: :cascade do |t|
    t.string "session"
    t.bigint "jwt_iat"
    t.bigint "previous_jwt_iat"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session"], name: "index_slots_jwt_sessions_on_session", unique: true
    t.index ["user_id"], name: "index_slots_jwt_sessions_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.boolean "admin", default: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["username"], name: "index_users_on_username"
  end

end
