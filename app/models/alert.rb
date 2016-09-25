class Alert < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  ALERT_TYPES = [
    'challenged',
    'won',
    'lost',
    'declined'
  ]

  validates :alert_type, inclusion: { in: ALERT_TYPES }, presence: true

  scope :unread, -> { where(is_read: false) }

  def display_text
    case alert_type
    when 'challenged'
      'You have been challenged!'
    when 'declined'
      'The challenged was declined.'
    when 'won'
      "Yahooo! You are the happy winner of #{challenge.points} points!!!"
    when 'lost'
      'Better luck next time, loser!'
    end
  end

end
