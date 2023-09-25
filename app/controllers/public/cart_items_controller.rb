class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_cart_item, only: [:update,:destroy]

  def index
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end

  def update
     @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to public_cart_items_path, notice: "数量を変更しました。"
    else
      flash.now[:notice] = "数量を変更できませんでした。"
      @cart_items = CartItem.where(customer:current_cutomer)
      @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
      render :index
    end
  end

  def destroy
    @cart_item =CartItem.find(params[:id])
    if @cart_item.destroy
      redirect_to public_cart_items_path, notice: "商品を削除しました。"
    else
      flash.now[:notice] = "商品の削除に失敗しました。"
      render :public_cart_items_path
    end
  end

  def destroy_all
    if current_customer.cart_items.destroy_all
      redirect_to public_cart_items_path, notice: "カートを空にしました。"
    else
      flash.now[:notice] = "削除に失敗しました。"
      render :public_cart_items_path
    end
  end

  def create
    item = Item.find(params[:cart_item][:item_id])

    cart_item_exist = current_customer.cart_items.find_by(item: item)

    if cart_item_exist
      new_amount = cart_item_exist.amount + cart_item_params[:amount].to_i
      cart_item_exist.update(amount: new_amount)
      redirect_to public_cart_items_path,notice: 'カートに商品を追加しました'
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.save
      redirect_to public_cart_items_path,notice: 'カートに商品を追加しました'
    end
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id,:price, :amount)
  end

  def set_cart_item
    @cart_item = current_customer.cart_items
  end
end
