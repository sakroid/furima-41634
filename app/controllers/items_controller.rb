class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def new
    @item = Item.new
  end

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :status_id, :fee_status_id, :prefecture_id, :schedule_delivery_id,
                                 :price, :image).merge(user_id: current_user.id)
  end
end
