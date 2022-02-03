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

ActiveRecord::Schema.define(version: 20220203070848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "cults", force: :cascade do |t|
    t.string   "title"
    t.integer  "release_date"
    t.string   "leading_figure"
    t.text     "technical_terms"
    t.integer  "cult_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.text     "scriptures",      default: "--- []\n"
    t.text     "triggers",        default: "--- []\n"
    t.text     "figures",         default: "--- []\n"
  end

  create_table "figures", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "position"
    t.integer  "cult_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scriptures", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "position"
    t.integer  "cult_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "terms", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "position"
    t.integer  "cult_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "triggers", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "position"
    t.integer  "cult_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
