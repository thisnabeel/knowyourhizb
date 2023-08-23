class CreateChapters < ActiveRecord::Migration
  def change
    create_table "chapters", force: :cascade do |t|
      t.string "title"
      t.string "image"
      t.text "body"
      t.text "description"
      t.integer "difficulty"
      t.integer "position"
      t.bigint "chapter_id"
      t.boolean "visibility"
      t.string "code"
      t.string "slug"
      t.boolean "is_course"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["chapter_id"], name: "index_chapters_on_chapter_id"
    end
  end
end
