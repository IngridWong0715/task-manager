class ItemsController < ApplicationController
  def create
    item = Item.create(item_params)
    redirect_to list_path(item.list) #CHANGE!!!
  end

  def index
  end



  private

  def item_params
    params.require(:item).permit(:name, :description, :list_id)
  end
end
