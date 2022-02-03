class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.string :title
      t.text :body
      t.integer :position
      t.integer :cult_id
      t.timestamps null: false
    end
  end
end
