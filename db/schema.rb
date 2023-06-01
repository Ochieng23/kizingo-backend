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

ActiveRecord::Schema[7.0].define(version: 2023_06_01_122245) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.integer "phase_id"
    t.string "description"
    t.date "start_date"
    t.date "end_date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string "avatar"
    t.string "admin_code"
    t.string "full_name"
    t.string "user_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agents", force: :cascade do |t|
    t.string "avatar"
    t.string "name"
    t.string "email"
    t.integer "phone_number"
    t.integer "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "construction_sites", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "media"
    t.date "start_date"
    t.date "end_date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "constructionsitesworkers", force: :cascade do |t|
    t.integer "construction_site_id"
    t.integer "staff_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "house_seekers", force: :cascade do |t|
    t.string "avatar"
    t.string "user_code"
    t.string "house_seeker_code"
    t.string "location"
    t.string "profession"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.string "name"
    t.string "brand"
    t.string "status"
    t.integer "quantity"
    t.integer "construction_site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "suppliers"
    t.string "suppliers_contact"
  end

  create_table "phases", force: :cascade do |t|
    t.string "name"
    t.string "construction_site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "progresses", force: :cascade do |t|
    t.integer "subactivity_id"
    t.string "progress_percentage"
    t.date "progress_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "media"
    t.string "description"
    t.string "listing_type"
    t.string "sqft"
    t.string "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.integer "phone_number"
    t.integer "national_id"
    t.string "payrate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subactivities", force: :cascade do |t|
    t.string "name"
    t.integer "activity_id"
    t.string "description"
    t.date "start_date"
    t.date "end_date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "user_code"
    t.string "password_digest"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
