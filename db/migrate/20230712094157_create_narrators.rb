class CreateNarrators < ActiveRecord::Migration
  def change

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

  end
end
