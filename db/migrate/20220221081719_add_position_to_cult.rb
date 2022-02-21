class AddPositionToCult < ActiveRecord::Migration
  def change
  	add_column :cults, :position, :integer
  end
end
