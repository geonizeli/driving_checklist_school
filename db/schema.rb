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

ActiveRecord::Schema[7.0].define(version: 2022_06_25_190722) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lesson_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "min_required", default: 0, null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string "name"
    t.bigint "lesson_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_category_id"], name: "index_lessons_on_lesson_category_id"
  end

  add_foreign_key "lessons", "lesson_categories"
end
