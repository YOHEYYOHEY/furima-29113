class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index :show]
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end


  private

  def item_params
    params.require(:item).permit(:name, :image)
  end

end