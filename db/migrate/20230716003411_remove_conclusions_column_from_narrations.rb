class RemoveConclusionsColumnFromNarrations < ActiveRecord::Migration
  def change
    remove_column :narrations, :conclusions
  end
end
