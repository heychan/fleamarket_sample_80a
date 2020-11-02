class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC').limit(5)
  end

  def new
    @item = Item.new
    @item_image = @item.item_images.build
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
    # @user = User.find(params[:id])
    @category = Category.find(388)
    @item = Item.find(params[:id])
    @condition = Condition.find(params[:id])
    @shipping_cost = ShippingCost.find(params[:id])
    @area = Area.find(params[:id])
    @day = Day.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :condition_id, :shipping_cost_id, :area_id, :day_id, item_images_attributes: [:id, :item_id, :image] )
  end
end
