class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates_presence_of :start_date, :end_date, :price
  validate :date_validity

  def date_validity
    if start_date < Date.today
      errors.add(:start_date, "can not be before today")
    end

    if end_date < Date.today
      errors.add(:end_date, "can not be before today")
    end
  end
end
