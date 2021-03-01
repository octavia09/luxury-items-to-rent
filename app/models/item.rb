class Item < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :description, :size, :price, :category
  CATEGORIES = ["bags", "dresses", "shoes"]
  validates :category, inclusion: { in: CATEGORIES }
end
