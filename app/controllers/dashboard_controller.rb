class DashboardController < ApplicationController
  def my_offers
    @user = current_user
    @items = @user.items
  end
end
