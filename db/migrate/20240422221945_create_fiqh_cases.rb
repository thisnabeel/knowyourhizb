class CreateFiqhCases < ActiveRecord::Migration
  def change
    create_table :fiqh_cases do |t|
      t.string :title
      t.integer :position
      t.text :description
      t.belongs_to :fiqh_case, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
