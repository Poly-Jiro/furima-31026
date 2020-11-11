class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])  
  end

  def create
    @record_shipping_address = RecordShippingAddress.new(order_params)
    if @record_shipping_address.valid?
      @record_shipping_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end
  
    private

    def order_params
      params.require(:record_shipping_address).permit(:user, :item, :postal_code, :prefecture, :municipality, :street_number, :building_name, :telephone_number, :record) 
    end
end
