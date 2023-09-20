class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to request.referer
  end

  private

  def order_params
    params.require(:order_detail).permit(:production_status)
  end
end
