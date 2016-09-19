class RemoveNotNullFromChallenges < ActiveRecord::Migration[5.0]
  def change
    change_column :challenges, :challengee_time, :integer, null: true
    change_column :challenges, :points, :integer, null: true
    change_column :challenges, :winner_id, :integer, null: true
  end
end
