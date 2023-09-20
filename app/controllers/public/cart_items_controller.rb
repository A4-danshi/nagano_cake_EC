class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_cart_item, only: [:update,:destroy]
  
  def index
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end
  
  def update
    new_amount = params[:cart_item][:item_id].to_i
    if @cart_item.update(amount: new_amount)
      redirect_to cart_items_path, notice: '更新しました'
    else
      flash.now[:alert] = '更新に失敗しました'
      render :index
    end
  end
  
  def destroy
    @cart_item.destroy
    redirect_to request.referer, notice: '商品を削除しました'
  end
  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path, notice: 'カート内を空にしました'
  end
  def create
    item = Item.find(params[:cart_item][:item_id])
    
    cart_item_exist = current_customer.cart_items.find_by(item: item)
    
    if cart_item_exist
      new_amount = cart_item_exist.amount + cart_item_params[:amount].to.i
      cart_item_exist.update(amount: new_amount)
      redirect_to cart_items_path,notice: 'カートに商品を追加しました'
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.save
    end
  end
  
  private
  
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
  
  def set_cart_item
    @cart_item = current_customer.cart_items.find(params[:id])
  end
end
