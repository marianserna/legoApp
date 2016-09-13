class Dragonfly < ApplicationRecord
  belongs_to :user

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  validates :name, :breeding_time, :user_id, presence: true
  validates :name, :age, :level, :slug, :challenge_points, :likes_count, presence: true
end
