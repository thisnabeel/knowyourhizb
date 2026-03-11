class AddTitleToConclusions < ActiveRecord::Migration[8.1]
  def change
    add_column :conclusions, :title, :string
  end
end

