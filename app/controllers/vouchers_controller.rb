class VouchersController < ApplicationController
  before_action :authenticate_devise_api_token!

  def index
    @vouchers = current_devise_api_user.vouchers.all
    render json: @vouchers
  end

  def show
    @voucher = current_devise_api_user.vouchers.find(params[:id])
    render json: @voucher
  end

  def create
    @voucher = current_devise_api_user.vouchers.new(voucher_params)

    if @voucher.save
      render json: @voucher, status: :created
    else
      render json: @voucher.errors, status: :unprocessable_entity
    end
  end

  def update
    @voucher = current_devise_api_user.vouchers.find(params[:id])
    
    if @voucher.update(voucher_params)
      render json: @voucher
    else
      render json: @voucher.errors, status: :unprocessable_entity
    end
  end

  private

  def voucher_params
    params.require(:voucher).permit(:expiry_date, :value, :status, :unit_id)
  end
end
