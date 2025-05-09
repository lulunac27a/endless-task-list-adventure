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

ActiveRecord::Schema[7.2].define(version: 2024_09_18_030854) do
  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.datetime "due_date"
    t.integer "repeat_interval"
    t.string "repeat_frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.float "xp"
    t.float "xp_required"
    t.float "total_xp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
