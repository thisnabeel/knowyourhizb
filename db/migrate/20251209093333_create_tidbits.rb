class CreateTidbits < ActiveRecord::Migration[8.1]
  def change
    create_table :tidbits do |t|
      t.integer :narrator_id
      t.string :title
      t.text :description

      t.timestamps
    end
    
    add_index :tidbits, :narrator_id
  end
end
