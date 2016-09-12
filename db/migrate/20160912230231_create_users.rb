class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.string :level, null: false
      t.string :slug, null: false
      t.integer :challenge_points, null: false
      t.integer :likes_count, null: false
      # add_attachment :users, :image
      t.timestamps
    end
  end
end
