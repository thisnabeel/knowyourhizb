class CreateNarrations < ActiveRecord::Migration
  def change
    create_table "narrations", force: :cascade do |t|
      t.integer "position"
      t.integer "hadith_chapter_id"
      t.text    "arabic"
      t.text    "english"
      t.text    "annotated_arabic"
      t.integer "hadith_book_id"
      t.string  "chain"
      t.text    "notes"
      t.text    "conclusions"
    end

    add_index "narrations", ["hadith_chapter_id"], name: "index_narrations_on_hadith_chapter_id", using: :btree
  end
end
