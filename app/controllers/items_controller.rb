class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save

      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @items = Item.order('created_at DESC')
  end

  def edit
    if current_user.id == @item.user_id and @item.purchase == nil

      render :edit

    else

      redirect_to root_path

    end
  end

  def update
    if @item.update(item_params)

      redirect_to item_path

    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id and @item.purchase == nil
      @item.destroy

    else
      redirect_to root_path
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :category_id, :status_id, :delivery_charge_id, :delivery_area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end
