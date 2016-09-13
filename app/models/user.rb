class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :dragonfly
  has_many :received_likes, class_name: 'Like', foreign_key: 'liked_user_id'
  has_many :given_likes, class_name: 'Like', foreign_key: 'likedby_by_user_id'
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  validates :name, :age, :level, :slug, :challenge_points, :likes_count, presence: true
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
