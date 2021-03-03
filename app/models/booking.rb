class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates_presence_of :start_date, :end_date, :price
end
