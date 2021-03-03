class BookingsController < ApplicationController

  before_action :set_booking, only: [:edit, :update, :destroy]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @item = Item.find(params[:item_id])
    @booking.itenm = @item

    if @booking.save
      redirect_to @item
    else
      render @item
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price)
  end
end
