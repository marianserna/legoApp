class Challenge < ApplicationRecord
  belongs_to :challenger, class_name: 'User'
  belongs_to :challengee, class_name: 'User'

  validates :challenge_status, :challenger_id, :challengee_id, :challenger_time, :challengee_time, :winner_id, :points, presence: true
end
