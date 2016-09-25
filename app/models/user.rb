class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :trackable, :rememberable,
         :recoverable, :validatable

  has_one :dragonfly, autosave: true, inverse_of: :user
  accepts_nested_attributes_for :dragonfly
  has_many :challenges, class_name: 'challenge', foreign_key: 'challenger_id'
  has_many :received_likes, class_name: 'Like', foreign_key: 'liked_user_id'
  has_many :given_likes, class_name: 'Like', foreign_key: 'likedby_by_user_id'
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  validates :name, :age, :level, :challenge_points, :likes_count, :image, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  # Run this method before validation but only when creating a user
  before_validation :set_defaults, on: [:create]

  def breeding_time
    dragonfly.breeding_time
  end

  def my_challenges
    Challenge.where(challenger_id: id).or(
      Challenge.where(challengee_id: id)
      )
  end

  def add_points(points)
    self.challenge_points += points
    save!
  end

  private

  def set_defaults
    # Set level to beginner only if level doesnt have a value
    self.level ||= 'Beginner'
    self.challenge_points ||= 0
    self.likes_count ||= 0
  end
end
