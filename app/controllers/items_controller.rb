class ItemsController < ApplicationController
  def index
  end

  def destory
  end

  def new
  end

  def create
    
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :price, :status_id, :fee_id, :source_id, :schedule_id, :category_id).merge(user_id: current_user.id)

end
