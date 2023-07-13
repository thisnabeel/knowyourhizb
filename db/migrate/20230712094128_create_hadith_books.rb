class CreateHadithBooks < ActiveRecord::Migration
  def change
    create_table "hadith_books", force: :cascade do |t|
      t.text    "title"
      t.text    "notes"
      t.integer "position"
      t.integer "hadith_collection_id"
    end

    add_index "hadith_books", ["hadith_collection_id"], name: "index_hadith_books_on_hadith_collection_id", using: :btree

  end
end
