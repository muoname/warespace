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

ActiveRecord::Schema[7.0].define(version: 2022_10_11_193734) do
  create_table "rents", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "space_id"
    t.integer "user_id"
    t.decimal "duration", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spaces", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "space_id"
    t.integer "user_id"
    t.decimal "price", precision: 10
    t.string "location"
    t.string "space_size"
    t.string "description"
    t.string "photos"
    t.boolean "is_occupied"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id"
    t.string "email"
    t.string "password"
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "phone"
    t.boolean "is_renter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
