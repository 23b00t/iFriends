class Review < ApplicationRecord
  belongs_to :user
  belongs_to :imaginary_friend

  validates :comment, :rating, presence: true
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }
end
