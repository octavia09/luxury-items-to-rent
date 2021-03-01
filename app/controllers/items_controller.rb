class ItemsController < ApplicationController

  def index
    raise
    if params[:search].present?
      @items = Item.where(category: params[:search][:query])
    else
      @items = Item.all
    end
  end

  def show
    @item = Item.find(params[:id])
  end
end
