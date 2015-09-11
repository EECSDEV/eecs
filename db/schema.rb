# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150812133144) do

  create_table "adminparams", force: :cascade do |t|
    t.integer  "point_get_feedback"
    t.integer  "point_get_pastexam"
    t.integer  "point_need_feedback"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "point_need_pastexam"
  end

  create_table "camp_activities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "camp_activity_workerships", force: :cascade do |t|
    t.integer  "camp_worker_id"
    t.integer  "camp_activity_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "camp_practices", force: :cascade do |t|
    t.string   "name"
    t.datetime "starts_at"
    t.integer  "camp_activity_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "camp_workers", force: :cascade do |t|
    t.string   "name"
    t.string   "gender"
    t.integer  "grade"
    t.string   "email"
    t.string   "cellphone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "level"
    t.integer  "department"
    t.integer  "team"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "instructor"
    t.integer  "grade"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.text     "content"
    t.integer  "rating"
    t.integer  "year"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "lecture_way"
    t.text     "test_homework"
    t.text     "partitioning"
    t.text     "other"
    t.integer  "point_get",     default: 0
    t.integer  "visit_time",    default: 0
  end

  create_table "pastexams", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.string   "file"
    t.integer  "exam_type"
    t.boolean  "has_answer"
    t.integer  "year"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "which_time"
    t.integer  "point_get",     default: 0
    t.integer  "download_time", default: 0
    t.string   "description"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                            default: "", null: false
    t.string   "encrypted_password",               default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                    default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "class_year",             limit: 3
    t.integer  "is_admin",                         default: -1
    t.integer  "rank",                             default: 0
    t.text     "description"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nick_name"
    t.integer  "maxrank",                          default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
