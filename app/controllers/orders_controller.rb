class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id]) 
    @purchase = Purchase.new
  end

  def create
    @item = Item.find(params[:item_id]) 
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end




  private
  def purchase_params
    params.require(:purchase).permit(:postal_code, :source_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id , item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
   end

end
