# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_17_151356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "location"
    t.string "event_type"
    t.datetime "start"
    t.datetime "end"
    t.integer "team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.integer "age"
    t.integer "team_id"
    t.string "password_digest"
    t.string "uid"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "event_id"
    t.integer "player_id"
    t.string "attending"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "age"
  end

end
