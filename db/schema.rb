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

ActiveRecord::Schema.define(version: 20151120192713) do

  create_table "activity_processes", force: :cascade do |t|
    t.integer  "SelectiveProcess_id"
    t.string   "name_activity"
    t.string   "responsible_activity"
    t.text     "descricao_activity"
    t.date     "deadline_activity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activity_processes", ["SelectiveProcess_id"], name: "index_activity_processes_on_SelectiveProcess_id"

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "ActivityProcess_id"
    t.string   "autor"
    t.string   "subject"
    t.text     "content"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "feedbacks", ["ActivityProcess_id"], name: "index_feedbacks_on_ActivityProcess_id"

  create_table "selective_processes", force: :cascade do |t|
    t.string   "name_process"
    t.string   "responsible"
    t.date     "deadline"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string  "name"
    t.string  "email"
    t.boolean "is_admin"
    t.string  "password_digest"
    t.string  "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
