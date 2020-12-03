class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id]) 
    @purchase = Purchase.new
  end

  def create
    @item = Item.find(params[:item_id]) 
    @purchase = Purchase.new(purchase_params)
    # binding.pry
    if @purchase.valid?
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end




  private
  def purchase_params
    params.require(:purchase).permit(:postal_code, :source_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id , item_id: params[:item_id])
  end

end
