class CreateNarrationSources < ActiveRecord::Migration
  def change
    create_table "narration_sources", force: :cascade do |t|
      t.integer "narrator_narration_id", null: false
      t.integer "source_narrator_narration_id", null: false
    end

    add_index "narration_sources", ["narrator_narration_id"], name: "index_narration_sources_on_narrator_narration_id", using: :btree
    add_index "narration_sources", ["source_narrator_narration_id"], name: "index_narration_sources_on_source_narrator_narration_id", using: :btree
    add_index "narration_sources", ["narrator_narration_id", "source_narrator_narration_id"], 
              name: "index_narration_sources_unique", 
              unique: true, 
              using: :btree
  end
end

