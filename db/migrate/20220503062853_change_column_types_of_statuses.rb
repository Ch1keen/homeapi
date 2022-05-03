class ChangeColumnTypesOfStatuses < ActiveRecord::Migration[6.1]
  def change
    change_column :statuses, :temperature, :float
    change_column :statuses, :humidity, :float
    change_column :statuses, :pm1p0, :float
    change_column :statuses, :pm2p5, :float
    change_column :statuses, :pm10, :float
    change_column :statuses, :gas, :float
  end
end
