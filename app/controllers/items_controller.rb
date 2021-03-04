class ItemsController < ApplicationController
before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present? && params[:search][:query].present?
      @items = Item.global_search(params[:search][:query])
    else
      @items = Item.all
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @item = Item.new
  end

  def edit
    unless @item.user == current_user
      redirect_to @item
    end
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to @item, notice: "Item was succesfully saved"
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: "Item was succesfully updated"
    else
      render :edit
    end
  end

  def destroy
    if @item.user == current_user
      @item.delete
    else
      redirect_to items_path, notice: "Item was succesfully deleted"
    end
  end

private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :size, :price, :category, photos: [])
  end
end
