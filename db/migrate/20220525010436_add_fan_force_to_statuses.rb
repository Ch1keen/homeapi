class AddFanForceToStatuses < ActiveRecord::Migration[6.1]
  def change
    add_column :statuses, :fan_force, :integer
  end
end
