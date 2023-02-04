class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :imaginary_friend
  enum approved: %i[pending approved denied]
end
