class CreateItemTags < ActiveRecord::Migration[8.1]
  def change
    create_table :item_tags do |t|
      t.references :tag, null: false, foreign_key: true
      t.integer :taggable_id, null: false
      t.string  :taggable_type, null: false

      t.timestamps null: false
    end

    add_index :item_tags, [:taggable_type, :taggable_id]
    add_index :item_tags, [:tag_id, :taggable_type, :taggable_id], unique: true, name: "index_item_tags_on_tag_and_taggable"
  end
end

