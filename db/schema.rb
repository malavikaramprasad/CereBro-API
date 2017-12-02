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

ActiveRecord::Schema.define(version: 20171201234108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "devices", force: :cascade do |t|
    t.bigint "user_id"
    t.string "token"
    t.string "uid"
    t.string "os_version"
    t.string "platform"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_devices_on_user_id"
  end

  create_table "preferred_locations", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.decimal "x_coordinate"
    t.decimal "y_coordinate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_preferred_locations_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "description"
    t.integer "tag_id"
    t.integer "learner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tutor_id"
    t.boolean "tutor_accepted"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "comment"
    t.decimal "rating"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_reviews_on_question_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_skills", force: :cascade do |t|
    t.integer "user_id"
    t.integer "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "access_token"
    t.string "refresh_token"
    t.decimal "x_coordinate"
    t.decimal "y_coordinate"
    t.time "start_time"
    t.time "end_time"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
