class CreateFiqhTools < ActiveRecord::Migration[8.1]
  def change
    create_table :fiqh_tools do |t|
      t.string :title
      t.text :description
      t.integer :position
      t.integer :fiqh_tool_id

      t.timestamps
    end
    
    add_index :fiqh_tools, :fiqh_tool_id
    add_index :fiqh_tools, :position
  end
end

