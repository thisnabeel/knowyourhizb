class CreateConclusions < ActiveRecord::Migration
  def change
    create_table :conclusions do |t|
      t.text :body
      t.integer :position
      t.belongs_to :narration, index: true, foreign_key: true
      t.integer :signal

      t.timestamps null: false
    end
  end
end
