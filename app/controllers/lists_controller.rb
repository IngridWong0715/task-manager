class ListsController < ApplicationController
  # all routes are nested under user:
  # /users/:user_id/lists
  # a user should only be able to operate on her own lists
  before_action :require_authorization
  before_action :set_list, only: [:edit, :update, :destroy]


  def index

   @lists = current_user.lists

  end

  def new
    @list = List.new
  end

  def create
    current_user.lists.create(list_params)
    redirect_to user_lists_path(current_user)

  end

  def edit
  end

  def update
    @list.update(list_params)
    redirect_to user_lists_path(current_user)
  end

  def destroy
    @list.destroy
    redirect_to user_lists_path(current_user)

  end

  private

  def authorized_access?
    current_user.id.to_s == params[:user_id]
  end

  def require_authorization
    if !authorized_access?
      flash[:warning] = "You only have access to your own lists"
      redirect_to user_lists_path(current_user)
    end
  end

  def list_params
    params.require(:list).permit(:name, :description, :team_id, :user_id)
  end

  def set_list
    @list = List.find(params[:id])
  end


end
