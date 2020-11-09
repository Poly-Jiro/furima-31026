class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC')
    # @item_name = Category.find_by(id: @items.)
  end

  def destory
  end

  def show
    @item = Item.find(params[:id])
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

  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :price, :status_id, :fee_id, :source_id, :schedule_id, :category_id).merge(user_id: current_user.id)
  end
end
