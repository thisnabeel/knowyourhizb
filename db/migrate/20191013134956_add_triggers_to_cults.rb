class AddTriggersToCults < ActiveRecord::Migration
  def change
  	add_column :cults, :triggers, :text, default: []
  end
end
