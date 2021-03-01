class Item < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  validates_presence_of :name, :description, :size, :price, :category
  CATEGORIES = ["bag", "dress", "shoe"]
  validates :category, inclusion: { in: CATEGORIES }
end
