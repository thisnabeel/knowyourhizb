class AddReleaseDate < ActiveRecord::Migration
  def change
  	add_column :scriptures, :year, :integer
  	add_column :figures, :year, :integer
  end
end
