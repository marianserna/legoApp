class User < ApplicationRecord
  has_one :dragonfly

  validates :name, :age, :level, :slug, :challenge_points, :likes_count, presence: true
end
