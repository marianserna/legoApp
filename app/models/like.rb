class Like < ApplicationRecord
  belongs_to :liked_user, class_name: 'User', foreign_key: 'liked_user_id'
  belongs_to :liked_by_user, class_name: 'User', foreign_key: 'liked_by_user_id'

  validates :liked_user_id, :liked_by_user_id, presence: true
end
