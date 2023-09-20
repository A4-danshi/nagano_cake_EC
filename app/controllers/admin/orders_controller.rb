class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = Order.order_detail.all
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to request.referer
  end
  
  private
  
  def order_params
    params.require(:order).permit(:status)
  end
end
