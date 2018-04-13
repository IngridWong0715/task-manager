class ListsController < ApplicationController
  # all routes are nested under user:
  # /users/:user_id/lists
  # a user should only be able to operate on her own lists
  before_action :require_authorization


  def index

   @lists = current_user.lists

  end

  def new
  end

  def create
    raise params.inspect
  end

  def show
  end

  def edit
  end

  def update
    raise params.inspect
  end

  def destroy
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

end
