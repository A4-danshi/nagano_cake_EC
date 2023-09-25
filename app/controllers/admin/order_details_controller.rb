class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    update_status
    redirect_to request.referer
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end

  def update_status
    if order_detail_params[:production_status].include?("producing")
      @order_detail.order.update(status: 2)
    elsif all_order_details_complete?
      @order_detail.order.update(status: 3)
    end
  end

  def all_order_details_complete?
    @order_detail.order.order_details.all? do |item|
      item.production_status == "finish"
    end
  end

end
