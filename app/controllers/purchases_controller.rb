class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_item

  def index
    @purchase_address = PurchaseAddress.new
    if current_user.id == @item.user_id
      redirect_to root_path
    end
    if @item.purchase.present?
      redirect_to root_path
    end
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      return redirect_to root_path
    else
      render 'purchases/index'
    end
  end


  private

  def move_to_item
    @item = Item.find(params[:item_id])
  end

  def purchase_address_params
    params.require(:purchase_address).permit(:postal_code, :shipping_prefecture_id, :city, :house_number, :building_number, :phone_number ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]    # PAY.JPテスト秘密鍵
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchase_address_params[:token],   # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end


end
