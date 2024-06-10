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

ActiveRecord::Schema.define(version: 20240603171450) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_stat_statements"
  enable_extension "pgcrypto"
  enable_extension "uuid-ossp"

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

  create_table "chapters", force: :cascade do |t|
    t.string   "title"
    t.string   "image"
    t.text     "body"
    t.text     "description"
    t.integer  "difficulty"
    t.integer  "position"
    t.integer  "chapter_id",  limit: 8
    t.boolean  "visibility"
    t.string   "code"
    t.string   "slug"
    t.boolean  "is_course"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "chapters", ["chapter_id"], name: "index_chapters_on_chapter_id", using: :btree

  create_table "conclusions", force: :cascade do |t|
    t.text     "body"
    t.integer  "position"
    t.integer  "narration_id"
    t.integer  "signal"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "conclusions", ["narration_id"], name: "index_conclusions_on_narration_id", using: :btree

  create_table "cults", force: :cascade do |t|
    t.string   "title"
    t.integer  "release_date"
    t.integer  "cult_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.text     "figures",      default: "--- []\n"
    t.integer  "position"
  end

  create_table "figures", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "position"
    t.integer  "cult_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "year"
  end

  create_table "fiqh_case_principles", force: :cascade do |t|
    t.boolean  "passing"
    t.integer  "fiqh_principle_id"
    t.integer  "fiqh_case_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "fiqh_case_principles", ["fiqh_case_id"], name: "index_fiqh_case_principles_on_fiqh_case_id", using: :btree
  add_index "fiqh_case_principles", ["fiqh_principle_id"], name: "index_fiqh_case_principles_on_fiqh_principle_id", using: :btree

  create_table "fiqh_cases", force: :cascade do |t|
    t.string   "title"
    t.integer  "position"
    t.text     "description"
    t.integer  "fiqh_case_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "fiqh_cases", ["fiqh_case_id"], name: "index_fiqh_cases_on_fiqh_case_id", using: :btree

  create_table "fiqh_principles", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "hadith_books", force: :cascade do |t|
    t.text    "title"
    t.text    "notes"
    t.integer "position"
    t.integer "hadith_collection_id"
  end

  add_index "hadith_books", ["hadith_collection_id"], name: "index_hadith_books_on_hadith_collection_id", using: :btree

  create_table "hadith_chapters", force: :cascade do |t|
    t.text    "title"
    t.text    "notes"
    t.integer "position"
    t.integer "hadith_book_id"
  end

  add_index "hadith_chapters", ["hadith_book_id"], name: "index_hadith_chapters_on_hadith_book_id", using: :btree

  create_table "hadith_collections", force: :cascade do |t|
    t.string "title"
    t.string "author"
  end

  create_table "line_translations", force: :cascade do |t|
    t.integer  "line_id"
    t.string   "language"
    t.string   "content"
    t.text     "content_explanation"
    t.text     "grammar_explanation"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "line_translations", ["line_id"], name: "index_line_translations_on_line_id", using: :btree

  create_table "lines", force: :cascade do |t|
    t.integer  "chapter_id"
    t.string   "font_style"
    t.text     "content"
    t.string   "direction"
    t.integer  "position"
    t.string   "recording_url"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "lines", ["chapter_id"], name: "index_lines_on_chapter_id", using: :btree

  create_table "narrations", force: :cascade do |t|
    t.integer "position"
    t.integer "hadith_chapter_id"
    t.text    "arabic"
    t.text    "english"
    t.text    "annotated_arabic"
    t.integer "hadith_book_id"
    t.string  "chain"
    t.text    "notes"
  end

  add_index "narrations", ["hadith_chapter_id"], name: "index_narrations_on_hadith_chapter_id", using: :btree

  create_table "narrator_narrations", force: :cascade do |t|
    t.integer "narrator_id"
    t.integer "narration_id"
    t.integer "position"
    t.string  "context_name"
    t.integer "uuid"
    t.string  "language"
  end

  add_index "narrator_narrations", ["narration_id"], name: "index_narrator_narrations_on_narration_id", using: :btree
  add_index "narrator_narrations", ["narrator_id"], name: "index_narrator_narrations_on_narrator_id", using: :btree

  create_table "narrators", force: :cascade do |t|
    t.integer  "scholar_index"
    t.string   "name"
    t.string   "grade"
    t.string   "parents"
    t.string   "spouse"
    t.text     "siblings"
    t.text     "children"
    t.string   "birth_date_place"
    t.string   "places_of_stay"
    t.string   "death_date_place"
    t.text     "teachers"
    t.text     "students"
    t.text     "area_of_interest"
    t.text     "tags"
    t.text     "books"
    t.text     "students_ids"
    t.text     "teachers_ids"
    t.string   "birth_place"
    t.string   "birth_date"
    t.string   "birth_date_gregorian"
    t.string   "birth_date_hijri"
    t.string   "death_date_hijri"
    t.string   "death_date_gregorian"
    t.string   "death_place"
    t.string   "death_reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pieces", force: :cascade do |t|
    t.string   "recording_url"
    t.string   "video_url"
    t.text     "translation"
    t.text     "content"
    t.integer  "chapter_id",    limit: 8
    t.integer  "uuid"
    t.integer  "position"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "scriptures", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "position"
    t.integer  "cult_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "year"
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

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.json     "tokens"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "conclusions", "narrations"
  add_foreign_key "fiqh_case_principles", "fiqh_cases"
  add_foreign_key "fiqh_case_principles", "fiqh_principles"
  add_foreign_key "fiqh_cases", "fiqh_cases"
  add_foreign_key "line_translations", "lines"
  add_foreign_key "lines", "chapters"
end
