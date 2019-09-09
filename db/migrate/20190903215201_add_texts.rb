class AddTexts < ActiveRecord::Migration
  def change
  	add_column :cults, :scriptures, :text, default: []
  end
end
