class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:edit, :update, :destroy]

  def new
    @booking = Booking.new
    @item = Item.find(params[:item_id])
  end




  def create
    @booking = Booking.new(booking_params)
    @item = Item.find(params[:item_id])
    @booking.item = @item
    @booking.user = current_user


    if @booking.save
      redirect_to @item, notice: "Your booking has been created..."

    else
      render :new
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price, :item_id)
  end


end

