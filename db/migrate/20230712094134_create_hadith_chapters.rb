class CreateHadithChapters < ActiveRecord::Migration
  def change
    create_table "hadith_chapters", force: :cascade do |t|
      t.text    "title"
      t.text    "notes"
      t.integer "position"
      t.integer "hadith_book_id"
    end

    add_index "hadith_chapters", ["hadith_book_id"], name: "index_hadith_chapters_on_hadith_book_id", using: :btree

  end
end
