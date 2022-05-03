class AddSerialNumberToHomes < ActiveRecord::Migration[6.1]
  def change
    add_column :homes, :serial_number, :string
  end
end
