class Item < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  validates_presence_of :name, :description, :size, :price, :category
  SIZES = ["XS", "S", "M", "L", "XL", "XXL"]
  CATEGORIES = ["bag", "dress", "shoe"]
  validates :category, inclusion: { in: CATEGORIES }
  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :category, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end






