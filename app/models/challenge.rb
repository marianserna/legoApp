class Challenge < ApplicationRecord
  belongs_to :challenger, class_name: 'User'
  belongs_to :challengee, class_name: 'User'

  validates :challenge_status, :challenger_id, :challengee_id, :challenger_time, presence: true

  before_validation :set_defaults, on: [:create]

  def participant?(user)
    user == challenger || user == challengee
  end

  private

  def set_defaults
    self.challenge_status ||= 'Pending'
    self.challenger_time ||= challenger.breeding_time
  end
end
