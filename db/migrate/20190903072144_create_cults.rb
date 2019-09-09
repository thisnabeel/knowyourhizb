class CreateCults < ActiveRecord::Migration
  def change
    create_table :cults do |t|
      t.string :title
      t.integer :release_date
      t.string :leading_figure
      t.text :technical_terms
      t.integer :cult_id

      t.timestamps null: false
    end
  end
end
