class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  def index
  end

  def new
    @item = Item.new
    @item_image = @item.item_images.build
    @parents = Category.where(ancestry: nil)
    respond_to do |format|
      format.html
      format.json do
        #親ボックスのidから子ボックスのidの配列を作成してインスタンス変数で定義
        if params[:parent_id].present?
          @children = Category.find(params[:parent_id]).children
        #子ボックスのidから孫ボックスのidの配列を作成してインスタンス変数で定義
        elsif params[:child_id].present?
          # binding.pry
          @grandchildren = Category.find(params[:child_id]).children
        end
      end
    end
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

# 商品購入確認ページのフロントエンド確認のため仮置き
  def buy

  end

  def done
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else  
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id,:brand_name, :condition_id, :shipping_cost_id, :area_id, :day_id, item_images_attributes: [:image, :_destroy, :id])
    # params.require(:item).permit(:name, :description, :price, :category_id,:brand_name, :condition_id, :shipping_cost_id, :area_id, :day_id, item_images_attributes: {image: [], _destroy: [], id: []})
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
