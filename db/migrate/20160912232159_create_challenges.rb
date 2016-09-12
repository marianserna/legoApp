class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.string :challenge_status, null: false
      t.integer :challenger_id, null: false
      t.integer :challengee_id, null: false
      t.integer :challenger_time, null: false
      t.integer :challengee_time, null: false
      t.integer :winner_id, null: false
      t.integer :points, null: false
      t.timestamps
    end
  end
end
