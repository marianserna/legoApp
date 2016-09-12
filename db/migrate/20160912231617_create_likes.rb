class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :liked_user_id, null: false
      t.integer :liked_by_user_id, null: false
      t.timestamps
    end
  end
end
