class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    @order.postage = 800
    @order.payment_method = params[:order][:payment_method]
    if params[:order][:select_address] == "0"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
      if params[:order][:address_id].present?
        @address = Address.find(params[:order][:address_id])
        @order.post_code = @address.post_code
        @order.address = @address.address
        @order.name = @address.name
      else
        flash.now[:notice] = "住所を選択してください。"
        render :new
      end
    elsif params[:order][:select_address] == "2"
      if params[:order][:post_code] == "" || params[:order][:address] == "" || params[:order][:name] == ""
        flash.now[:notice] = "お届け先を正しく入力してください。"
        render :new
      else
        @order.post_code = params[:order][:post_code]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
      end
    else
      flash.now[:notice] = "宛先を選択してください。"
      render :new
    end
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    @order.postage = 800
    if @order.save
      cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.item_id = cart_item.item.id
        order_detail.order_id = @order.id
        order_detail.amount = cart_item.amount
        order_detail.purchase_price = cart_item.item.with_tax_price
        order_detail.save
      end
      current_customer.cart_items.destroy_all
      redirect_to public_order_complete_path
    else
      flash[:notice] = "注文が確定できませんでした。もう一度やり直してください。"
      redirect_to public_cart_items_path
    end
  end

  def complete
  end

  def index
    @orders = current_customer.orders.order(id: 'DESC')

  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :name, :total_payment, :status, :customer_id)
  end

end
