class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  before_action :authenticate_user!, only: :index

  def index
    @item = Item.find(params[:item_id])
    @record_shipping_address = RecordShippingAddress.new
  end

  def create
    @record_shipping_address = RecordShippingAddress.new(order_params)
    if @record_shipping_address.valid?
      pay_item
      
      @record_shipping_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render 'index'
    end
  end

  private

  def order_params
    # form_withでモデルを指定しなければparams.permitでも大丈夫
    params.require(:record_shipping_address).permit(:postal_code, :prefecture, :municipality, :street_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: @item.price)
  end

  def move_to_index
    redirect_to root_path and return if @item.record.present?
    redirect_to root_path if user_signed_in? && (current_user.id == @item.user.id)
    # redirect_toで処理は止まらないので、returnで止めてやる。条件が当てはまると2回redirect処理が呼ばれエラーとなる。
    # root_pathの所はcontroller: :items, action: :indexこういう書き方もできる

  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end