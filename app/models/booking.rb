class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates_presence_of :start_date, :end_date, :price
  validate :date_validity
  validate :validate_other_booking_overlap

  # Callbacks
  before_validation :set_total_price, on: :create

  def set_total_price
    self.price = self.item.price.to_i * (self.end_date - self.start_date).to_i
  end

  def date_validity
    if start_date < Date.today
      errors.add(:start_date, "can not be before today")
    end

    if end_date < Date.today
      errors.add(:end_date, "can not be before today")
    end

    if end_date < start_date
      errors.add(:end_date, "end date can not be before star date")
    end
  end

  def period
    start_date..end_date
  end

  def validate_other_booking_overlap
    other_bookings = Booking.all
    is_overlapping = other_bookings.any? do |other_booking|
      period.overlaps?(other_booking.period)
    end
    errors.add(:overlaps_with_other, "Not available on these dates") if is_overlapping
  end

end
