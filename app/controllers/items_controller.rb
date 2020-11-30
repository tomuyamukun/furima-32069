class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :move_to_login, only: :edit
  before_action :item_find, only: [:show, :edit, :update]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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


  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :status_id, :fee_id, :source_id, :shipping_id, :price).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def move_to_login
    @item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == @item.user_id
    redirect_to user_session_path
    end
  end
end





