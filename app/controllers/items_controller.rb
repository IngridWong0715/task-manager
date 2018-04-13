class ItemsController < ApplicationController
  def create
    item = Item.create(item_params)
    list = item.list
    redirect_to user_list_path(item.user.id, item.list) #CHANGE!!! 
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :list_id)
  end
end
