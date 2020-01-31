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

ActiveRecord::Schema.define(version: 2020_01_28_132327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "affiliates", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "location"
    t.string "password_digest"
    t.string "account_type", default: "affiliate", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "athletes", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "account_type", default: "athlete", null: false
    t.bigint "coach_id"
    t.bigint "affiliate_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["affiliate_id"], name: "index_athletes_on_affiliate_id"
    t.index ["coach_id"], name: "index_athletes_on_coach_id"
  end

  create_table "coaches", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "account_type", default: "coach", null: false
    t.integer "affiliate_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "health_data", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "injuries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movement_injuries", force: :cascade do |t|
    t.bigint "movement_id", null: false
    t.bigint "injury_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["injury_id"], name: "index_movement_injuries_on_injury_id"
    t.index ["movement_id"], name: "index_movement_injuries_on_movement_id"
  end

  create_table "movements", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "skill_level"
    t.string "category"
    t.integer "scale_option_id"
    t.string "muscle_group"
    t.string "avoid_if_injured"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "workout_movements", force: :cascade do |t|
    t.bigint "workout_id", null: false
    t.bigint "movement_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movement_id"], name: "index_workout_movements_on_movement_id"
    t.index ["workout_id"], name: "index_workout_movements_on_workout_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name"
    t.string "wod_type"
    t.string "category"
    t.string "score"
    t.date "date"
    t.string "rep_scheme"
    t.string "workout"
    t.bigint "coach_id"
    t.bigint "athlete_id"
    t.bigint "affiliate_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["affiliate_id"], name: "index_workouts_on_affiliate_id"
    t.index ["athlete_id"], name: "index_workouts_on_athlete_id"
    t.index ["coach_id"], name: "index_workouts_on_coach_id"
  end

  add_foreign_key "athletes", "affiliates"
  add_foreign_key "athletes", "coaches"
  add_foreign_key "movement_injuries", "injuries"
  add_foreign_key "movement_injuries", "movements"
  add_foreign_key "workout_movements", "movements"
  add_foreign_key "workout_movements", "workouts"
  add_foreign_key "workouts", "affiliates"
  add_foreign_key "workouts", "athletes"
  add_foreign_key "workouts", "coaches"
end
