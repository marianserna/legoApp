class Challenge < ApplicationRecord
  belongs_to :challenger, class_name: 'User'
  belongs_to :challengee, class_name: 'User'
  belongs_to :winner, class_name: 'User', optional: true

  STATUSES = [
    'Pending',
    'Completed',
    'Declined'
  ]

  validates :challenge_status, :challenger_id, :challengee_id, :challenger_time, presence: true
  validates :challenge_status, inclusion: { in: STATUSES }


  before_validation :set_defaults, on: [:create]

  def participant?(user)
    user == challenger || user == challengee
  end

  def can_accept_or_decline?(user)
    challenge_status == 'Pending' && user == challengee
  end

  def complete!
    self.winner = find_winner
    self.points = 100
    self.challenge_status = 'Completed'
    save!
  end

  def decline!
    self.winner = challenger
    self.points = 50
    self.challenge_status = 'Declined'
    save!
  end

  private

  def find_winner
    if challengee_time < challenger_time
      challengee
    else
      challenger
    end
  end

  def set_defaults
    self.challenge_status ||= 'Pending'
    self.challenger_time ||= challenger.breeding_time
  end
end
