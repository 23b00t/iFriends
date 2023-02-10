class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :imaginary_friend
  enum approved: %i[pending approved denied], _default: :pending

  validates :start_date, presence: true
  validates :end_date, presence: true
end
