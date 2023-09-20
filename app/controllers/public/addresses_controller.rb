class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  def index
    @addresses = current_customer.addresses.all
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end
  
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "配送先を追加しました"
      redirect_to request.referer
    else
      @address = current_customer.addresses.all
      render :index
      flash[:notice] = "配送先の登録に失敗しました"
    end
  end
  
  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "配送先を変更しました"
      redirect_to addresses_path
    else
      render :edit
    end
  end
  
  def destroy
    Address.find(params[:id]).destroy
    flash[:notice] = "配送先を削除しました"
    redirect_to request.referer
  end
  
  private
  
  def address_params
    params.require(:address).permit(:customer_id,:name,:address,:post_code)
  end
end
