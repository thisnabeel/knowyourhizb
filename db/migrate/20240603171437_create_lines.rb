class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.belongs_to :chapter, index: true, foreign_key: true
      t.string :font_style
      t.text :content
      t.string :direction
      t.integer :position
      t.string :recording_url

      t.timestamps null: false
    end
  end
end
