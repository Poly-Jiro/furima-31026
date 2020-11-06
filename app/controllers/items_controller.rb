class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC')
  end

  def destory
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    # binding.pry
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :price, :status_id, :fee_id, :source_id, :schedule_id, :category_id).merge(user_id: current_user.id)
  end
end
