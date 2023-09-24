class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all.order(created_at: :desc)
  end
end
