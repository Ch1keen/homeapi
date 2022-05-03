class AddColumnToStatuses < ActiveRecord::Migration[6.1]
  # t.integer :home_id
  #     t.boolean :fan
  #     t.boolean :window

  def change
    add_column :statuses, :home_id, :integer
    add_column :statuses, :fan, :boolean
    add_column :statuses, :window, :boolean
  end
end
