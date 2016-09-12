class Like < ApplicationRecord
  belongs_to :user

  validates :liked_user_id, :liked_by_user_id, presence: true
end
