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

ActiveRecord::Schema[8.1].define(version: 2025_12_09_093333) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "extensions.pg_stat_statements"
  enable_extension "extensions.pgcrypto"
  enable_extension "extensions.uuid-ossp"
  enable_extension "pg_catalog.plpgsql"

  create_table "admins", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at", precision: nil
    t.datetime "reset_password_sent_at", precision: nil
    t.string "reset_password_token"
    t.datetime "updated_at", precision: nil, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "chapters", id: :serial, force: :cascade do |t|
    t.text "body"
    t.bigint "chapter_id"
    t.string "code"
    t.datetime "created_at", precision: nil, null: false
    t.text "description"
    t.integer "difficulty"
    t.string "image"
    t.boolean "is_course"
    t.integer "position"
    t.string "slug"
    t.string "title"
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "visibility"
    t.index ["chapter_id"], name: "index_chapters_on_chapter_id"
  end

  create_table "conclusions", id: :serial, force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", precision: nil, null: false
    t.integer "narration_id"
    t.integer "position"
    t.integer "signal"
    t.datetime "updated_at", precision: nil, null: false
    t.index ["narration_id"], name: "index_conclusions_on_narration_id"
  end

  create_table "cults", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.integer "cult_id"
    t.text "figures", default: "--- []\n"
    t.integer "position"
    t.integer "release_date"
    t.string "title"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "figures", id: :serial, force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", precision: nil, null: false
    t.integer "cult_id"
    t.integer "position"
    t.string "title"
    t.datetime "updated_at", precision: nil, null: false
    t.integer "year"
  end

  create_table "fiqh_case_principles", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.integer "fiqh_case_id"
    t.integer "fiqh_principle_id"
    t.boolean "passing"
    t.datetime "updated_at", precision: nil, null: false
    t.index ["fiqh_case_id"], name: "index_fiqh_case_principles_on_fiqh_case_id"
    t.index ["fiqh_principle_id"], name: "index_fiqh_case_principles_on_fiqh_principle_id"
  end

  create_table "fiqh_cases", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.text "description"
    t.integer "fiqh_case_id"
    t.integer "position"
    t.string "title"
    t.datetime "updated_at", precision: nil, null: false
    t.index ["fiqh_case_id"], name: "index_fiqh_cases_on_fiqh_case_id"
  end

  create_table "fiqh_principles", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.text "description"
    t.string "title"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "fiqh_tools", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.integer "fiqh_tool_id"
    t.integer "position"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["fiqh_tool_id"], name: "index_fiqh_tools_on_fiqh_tool_id"
    t.index ["position"], name: "index_fiqh_tools_on_position"
  end

  create_table "hadith_books", id: :serial, force: :cascade do |t|
    t.integer "hadith_collection_id"
    t.text "notes"
    t.integer "position"
    t.text "title"
    t.index ["hadith_collection_id"], name: "index_hadith_books_on_hadith_collection_id"
  end

  create_table "hadith_chapters", id: :serial, force: :cascade do |t|
    t.integer "hadith_book_id"
    t.text "notes"
    t.integer "position"
    t.text "title"
    t.index ["hadith_book_id"], name: "index_hadith_chapters_on_hadith_book_id"
  end

  create_table "hadith_collections", id: :serial, force: :cascade do |t|
    t.string "author"
    t.string "title"
  end

  create_table "line_translations", id: :serial, force: :cascade do |t|
    t.string "content"
    t.text "content_explanation"
    t.datetime "created_at", precision: nil, null: false
    t.text "grammar_explanation"
    t.string "language"
    t.integer "line_id"
    t.datetime "updated_at", precision: nil, null: false
    t.index ["line_id"], name: "index_line_translations_on_line_id"
  end

  create_table "lines", id: :serial, force: :cascade do |t|
    t.integer "chapter_id"
    t.text "content"
    t.datetime "created_at", precision: nil, null: false
    t.string "direction"
    t.string "font_style"
    t.integer "position"
    t.string "recording_url"
    t.datetime "updated_at", precision: nil, null: false
    t.index ["chapter_id"], name: "index_lines_on_chapter_id"
  end

  create_table "narration_sources", id: :serial, force: :cascade do |t|
    t.integer "narrator_narration_id", null: false
    t.integer "source_narrator_narration_id", null: false
    t.index ["narrator_narration_id", "source_narrator_narration_id"], name: "index_narration_sources_unique", unique: true
    t.index ["narrator_narration_id"], name: "index_narration_sources_on_narrator_narration_id"
    t.index ["source_narrator_narration_id"], name: "index_narration_sources_on_source_narrator_narration_id"
  end

  create_table "narrations", id: :serial, force: :cascade do |t|
    t.text "annotated_arabic"
    t.text "arabic"
    t.string "chain"
    t.text "english"
    t.integer "hadith_book_id"
    t.integer "hadith_chapter_id"
    t.text "notes"
    t.integer "position"
    t.index ["hadith_chapter_id"], name: "index_narrations_on_hadith_chapter_id"
  end

  create_table "narrator_narrations", id: :serial, force: :cascade do |t|
    t.string "context_name"
    t.string "language"
    t.integer "narration_id"
    t.integer "narrator_id"
    t.integer "position"
    t.integer "uuid"
    t.index ["narration_id"], name: "index_narrator_narrations_on_narration_id"
    t.index ["narrator_id"], name: "index_narrator_narrations_on_narrator_id"
  end

  create_table "narrators", id: :serial, force: :cascade do |t|
    t.text "area_of_interest"
    t.string "birth_date"
    t.string "birth_date_gregorian"
    t.string "birth_date_hijri"
    t.string "birth_date_place"
    t.string "birth_place"
    t.text "books"
    t.text "children"
    t.datetime "created_at", precision: nil
    t.string "death_date_gregorian"
    t.string "death_date_hijri"
    t.string "death_date_place"
    t.string "death_place"
    t.string "death_reason"
    t.string "grade"
    t.string "name"
    t.string "parents"
    t.string "places_of_stay"
    t.integer "scholar_index"
    t.text "siblings"
    t.string "spouse"
    t.text "students"
    t.text "students_ids"
    t.text "tags"
    t.text "teachers"
    t.text "teachers_ids"
    t.datetime "updated_at", precision: nil
  end

  create_table "pieces", id: :serial, force: :cascade do |t|
    t.bigint "chapter_id"
    t.text "content"
    t.datetime "created_at", precision: nil, null: false
    t.integer "position"
    t.string "recording_url"
    t.text "translation"
    t.datetime "updated_at", precision: nil, null: false
    t.integer "uuid"
    t.string "video_url"
  end

  create_table "scriptures", id: :serial, force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", precision: nil, null: false
    t.integer "cult_id"
    t.integer "position"
    t.string "title"
    t.datetime "updated_at", precision: nil, null: false
    t.integer "year"
  end

  create_table "terms", id: :serial, force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", precision: nil, null: false
    t.integer "cult_id"
    t.integer "position"
    t.string "title"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "tidbits", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.integer "narrator_id"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["narrator_id"], name: "index_tidbits_on_narrator_id"
  end

  create_table "triggers", id: :serial, force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", precision: nil, null: false
    t.integer "cult_id"
    t.integer "position"
    t.string "title"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "provider", default: "email", null: false
    t.datetime "remember_created_at", precision: nil
    t.datetime "reset_password_sent_at", precision: nil
    t.string "reset_password_token"
    t.json "tokens"
    t.string "uid", default: "", null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "conclusions", "narrations"
  add_foreign_key "fiqh_case_principles", "fiqh_cases"
  add_foreign_key "fiqh_case_principles", "fiqh_principles"
  add_foreign_key "fiqh_cases", "fiqh_cases"
  add_foreign_key "line_translations", "lines"
  add_foreign_key "lines", "chapters"
end
