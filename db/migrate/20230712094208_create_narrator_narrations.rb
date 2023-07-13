class CreateNarratorNarrations < ActiveRecord::Migration
  def change
    create_table "narrator_narrations", force: :cascade do |t|
      t.integer "narrator_id"
      t.integer "narration_id"
      t.integer "position"
      t.string "context_name"
      t.integer "uuid"
      t.string "language"
    end

    add_index "narrator_narrations", ["narration_id"], name: "index_narrator_narrations_on_narration_id", using: :btree
    add_index "narrator_narrations", ["narrator_id"], name: "index_narrator_narrations_on_narrator_id", using: :btree

  end
end
