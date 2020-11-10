class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :edit
  before_action :set_item, only: [:edit, :show, :update]
  before_action :move_to_index, only: :edit

  def index
    @items = Item.order('created_at DESC')
  end

  def destory
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item.id)
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :price, :status_id, :fee_id, :source_id, :schedule_id, :category_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in? && (current_user.id == @item.user.id)
  end
end
