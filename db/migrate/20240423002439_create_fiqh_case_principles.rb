class CreateFiqhCasePrinciples < ActiveRecord::Migration
  def change
    create_table :fiqh_case_principles do |t|
      t.boolean :passing
      t.belongs_to :fiqh_principle, index: true, foreign_key: true
      t.belongs_to :fiqh_case, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
