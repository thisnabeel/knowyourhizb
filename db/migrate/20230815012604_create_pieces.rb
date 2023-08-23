class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :recording_url
      t.string :video_url
      t.text :translation
      t.text :content
      t.bigint "chapter_id"
      t.integer :uuid
      t.integer :position

      t.timestamps null: false
    end
  end
end
