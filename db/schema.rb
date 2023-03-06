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

ActiveRecord::Schema.define(version: 2023_03_06_222657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "friend_requests", force: :cascade do |t|
    t.bigint "recipient_id", null: false
    t.bigint "sender_id", null: false
    t.string "status", default: "pending"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipient_id"], name: "index_friend_requests_on_recipient_id"
    t.index ["sender_id"], name: "index_friend_requests_on_sender_id"
  end

  create_table "habits", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.string "habit_type", null: false
    t.string "frequency", null: false
    t.integer "goal_frequenc", null: false
    t.boolean "private", default: false
    t.float "current_progress", default: 0.0
    t.float "top_streak", default: 0.0
    t.bigint "owner_id", null: false
    t.integer "steps_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_habits_on_owner_id"
  end

  create_table "steps", force: :cascade do |t|
    t.text "caption"
    t.string "image"
    t.integer "comments_count", default: 0
    t.integer "supports_count", default: 0
    t.bigint "habit_id", null: false
    t.datetime "date_completion", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["habit_id"], name: "index_steps_on_habit_id"
  end

  create_table "supports", force: :cascade do |t|
    t.string "support_type", null: false
    t.bigint "fan_id", null: false
    t.bigint "step_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fan_id"], name: "index_supports_on_fan_id"
    t.index ["step_id"], name: "index_supports_on_step_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.citext "username"
    t.boolean "private", default: false
    t.integer "supports_count", default: 0
    t.integer "comments_count", default: 0
    t.integer "habits_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "friend_requests", "users", column: "recipient_id"
  add_foreign_key "friend_requests", "users", column: "sender_id"
  add_foreign_key "habits", "users", column: "owner_id"
  add_foreign_key "steps", "habits"
  add_foreign_key "supports", "steps"
  add_foreign_key "supports", "users", column: "fan_id"
end
