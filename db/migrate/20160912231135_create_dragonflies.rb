class CreateDragonflies < ActiveRecord::Migration[5.0]
  def change
    create_table :dragonflies do |t|
      t.string :name, null: false
      t.integer :breeding_time, null: false
      # add_attachment :users, :image
      t.integer :user_id
      t.timestamps
    end
  end
end
