class AddFigures < ActiveRecord::Migration
  def change
  	add_column :cults, :figures, :text, default: []
  end
end
