class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :set_category, only:[:create]
  before_action :move_to_index, except: [:index]
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
    # binding.pry
    if @item.save
      redirect_to root_path
    else  
    @item.valid?
    flash.now[:alert] = @item.errors.full_messages
    render :new and return
    end
  end

  def show
    @item = Item.find(params[:id])
    #find_byでitemがあるかないかあったら@purchaseにいれる
    @purchase = Purchase.find_by(item_id: @item.id)
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
    params.require(:item).permit(:name, :description, :price, :category_id,:brand_name, :condition_id, :shipping_cost_id, :area_id, :day_id, item_images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_category
    @parents = Category.where(ancestry: nil)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_registration_path
    end
  end
end
