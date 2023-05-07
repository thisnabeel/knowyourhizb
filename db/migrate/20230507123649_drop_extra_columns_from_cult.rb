class DropExtraColumnsFromCult < ActiveRecord::Migration
  def change
    remove_column :cults, :triggers
    remove_column :cults, :technical_terms
    remove_column :cults, :leading_figure
    remove_column :cults, :scriptures
  end
end
