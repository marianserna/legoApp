class Dragonfly < ApplicationRecord
  belongs_to :user, inverse_of: :dragonfly

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  validates :name, :breeding_time, :image, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
