class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    update_production_status
    redirect_to request.referer
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

  def update_production_status
    if order_params[:status] == "confirm_payment"
      @order.order_details.update_all(production_status: 1)
    end
  end
end
