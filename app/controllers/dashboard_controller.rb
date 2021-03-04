class DashboardController < ApplicationController
  def my_offers
    @user = current_user
    @items = @user.items
  end

  def my_bookings
    @user = current_user
    @bookings = @user.bookings
  end
end
