class CreateFiqhPrinciples < ActiveRecord::Migration
  def change
    create_table :fiqh_principles do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
