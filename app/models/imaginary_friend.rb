class ImaginaryFriend < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings, dependent: :delete_all
  has_many :reviews, dependent: :delete_all
  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id }
  validates :price, presence: true
  # validates :special_abilities, inclusion: { in: ["Flying", "Warm hugs", "Invisibility", "Visibility",
                                                  # "Cooking", "Great advice"],
                                                  # message: "%<category> is not a valid category.
                                                  # Flying, Warm hugs, Invisibility, Visibility, Cooking, Great advice" }
end
