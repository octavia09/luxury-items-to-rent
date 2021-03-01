class Item < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  validates_presence_of :name, :description, :size, :price, :category
  CATEGORIES = ["bags", "dresses", "shoes"]
  SIZES = ["XXS", "XS", "S", "M", "L", "XL", "XXL", "XXXL", "XXXXL"]
  validates :size, inclusion: { in: SIZES }
  validates :category, inclusion: { in: CATEGORIES }
  has_many_attached :images

end
