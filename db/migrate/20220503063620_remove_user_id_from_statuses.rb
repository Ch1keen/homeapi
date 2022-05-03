class RemoveUserIdFromStatuses < ActiveRecord::Migration[6.1]
  def change
    remove_column :statuses, :user_id, :integer
  end
end
