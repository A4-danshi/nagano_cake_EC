class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "会員情報変更しました。"
      redirect_to public_customer_path
    else
      flash[:notice] = "変更内容が正しくありません。"
      redirect_to public_customer_edit_path
    end
  end

  def confirm
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を完了しました。ご利用ありがとうございました。"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :email, :post_code, :address, :phone_number)
  end


end
