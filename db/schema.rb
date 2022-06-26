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

ActiveRecord::Schema[7.0].define(version: 2022_06_26_150001) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.datetime "concluded_at", null: false
    t.bigint "lesson_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_achievements_on_lesson_id"
    t.index ["user_id"], name: "index_achievements_on_user_id"
  end

  create_table "lesson_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "min_required", default: 0, null: false
  end

  create_table "lesson_categories_subscriptions", id: false, force: :cascade do |t|
    t.bigint "subscription_id"
    t.bigint "lesson_category_id"
    t.index ["lesson_category_id"], name: "index_lesson_categories_subscriptions_on_lesson_category_id"
    t.index ["subscription_id"], name: "index_lesson_categories_subscriptions_on_subscription_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "name"
    t.bigint "lesson_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_category_id"], name: "index_lessons_on_lesson_category_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "started_at"
    t.date "concluded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "achievements", "lessons"
  add_foreign_key "achievements", "users"
  add_foreign_key "lessons", "lesson_categories"
  add_foreign_key "subscriptions", "users"
end
