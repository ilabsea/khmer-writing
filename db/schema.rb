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

ActiveRecord::Schema.define(version: 20170202014609) do

  create_table "contents", force: true do |t|
    t.string   "content"
    t.integer  "writing_method_id"
    t.integer  "lesson_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content_in_khmer"
    t.string   "image_clue"
    t.string   "audio"
    t.string   "image"
    t.string   "image_answer"
  end

  add_index "contents", ["lesson_id"], name: "index_contents_on_lesson_id"
  add_index "contents", ["writing_method_id"], name: "index_contents_on_writing_method_id"

  create_table "grades", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "code"
  end

  create_table "lessons", force: true do |t|
    t.string   "name"
    t.integer  "grade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "khmer_numeric"
  end

  add_index "lessons", ["grade_id"], name: "index_lessons_on_grade_id"

  create_table "users", force: true do |t|
    t.string  "username"
    t.string  "password_digest"
    t.boolean "is_super_user"
  end

  create_table "writing_methods", force: true do |t|
    t.string   "name"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "code"
  end

end
