class ImaginaryFriend < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id }
  validates :price, presence: true
  # validates :special_abilities, inclusion: { in: ["Flying", "Warm hugs", "Invisibility", "Visibility",
                                                  # "Cooking", "Great advice"],
                                                  # message: "%<category> is not a valid category.
                                                  # Flying, Warm hugs, Invisibility, Visibility, Cooking, Great advice" }
end
