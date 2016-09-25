class AddIsReadToAlerts < ActiveRecord::Migration[5.0]
  def change
    add_column :alerts, :is_read, :boolean, null: false, default: false
  end
end
