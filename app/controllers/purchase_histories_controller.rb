class PurchaseHistoriesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!

  def index
    if @item.user != current_user && @item.purchase_history.nil?
      @purchase_order = PurchaseOrder.new
    else
      redirect_to root_path
    end
  end

  def create
    @purchase_order = PurchaseOrder.new(purchase_history_params)
    if @purchase_order.valid?
      pay_item
      @purchase_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_history_params
    params.require(:purchase_order).permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  # source ~/.zshrc
  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.item_price,              # 商品の値段
      card: purchase_history_params[:token], # カードトークン
      currency: 'jpy'                        # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
