class Dragonfly < ApplicationRecord
  belongs_to :user

  validates :name, :breeding_time, :user_id, presence: true
end
