class ImaginaryFriend < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id }
  validates :price, presence: true
end
