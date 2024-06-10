class CreateLineTranslations < ActiveRecord::Migration
  def change
    create_table :line_translations do |t|
      t.belongs_to :line, index: true, foreign_key: true
      t.string :language
      t.string :content
      t.text :content_explanation
      t.text :grammar_explanation

      t.timestamps null: false
    end
  end
end
