class ImaginaryFriend < ApplicationRecord

  include AlgoliaSearch

  algoliasearch do
    attributes :name, :description
    minWordSizefor1Typo 4
    minWordSizefor2Typos 8
  end

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_one_attached :photo
  belongs_to :user
  has_many :bookings, dependent: :delete_all
  has_many :reviews, dependent: :delete_all
  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id }
  validates :price, presence: true
end
