class CreateHadithCollections < ActiveRecord::Migration
  def change

    create_table "hadith_collections", force: :cascade do |t|
      t.string "title"
      t.string "author"
    end
  end
end
