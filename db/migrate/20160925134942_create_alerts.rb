class CreateAlerts < ActiveRecord::Migration[5.0]
  def change
    create_table :alerts do |t|
      t.integer :user_id, null: false
      t.integer :challenge_id, null: false
      t.string :alert_type, null: false
      t.timestamps
    end
  end
end
