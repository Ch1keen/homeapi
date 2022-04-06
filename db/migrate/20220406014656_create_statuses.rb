class CreateStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :statuses do |t|
      t.integer :user_id
      t.integer :temperature
      t.integer :humidity
      t.integer :pm1p0
      t.integer :pm2p5
      t.integer :pm10
      t.integer :gas
      t.integer :brightness

      t.timestamps
    end
  end
end
