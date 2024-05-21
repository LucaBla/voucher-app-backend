class VouchersController < ApplicationController
  before_action :authenticate_devise_api_token!

  def index
    @vouchers = current_devise_api_user.vouchers.all
    if params[:status].present?
      @vouchers = @vouchers.where(status: params[:status]) 
    end
    if params[:min_value].present?
      @vouchers = @vouchers.where('value >= ?', params[:min_value]) 
    end
    if params[:max_value].present?
      @vouchers = @vouchers.where('value <= ?', params[:max_value]) 
    end
    if params[:unit_id].present?
      @vouchers = @vouchers.where(unit_id: params[:unit_id]) 
    end
    if params[:created_after].present?
      @vouchers = @vouchers.where('created_at >= ?', params[:created_after])
    end
    if params[:created_until].present?
      @vouchers = @vouchers.where('created_at <= ?', params[:created_until])
    end
    if params[:expires_after].present?
      @vouchers = @vouchers.where('expiry_date > ?', params[:expires_after])
    end
    if params[:expires_until].present?
      @vouchers = @vouchers.where('expiry_date <= ?', params[:expires_until])
    end

    render json: @vouchers, include: [:unit]
  end

  def show
    @voucher = current_devise_api_user.vouchers.find(params[:id])
    render json: @voucher, include: [:unit, business: { except: :email }]
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

  def destroy
    @voucher = current_devise_api_user.vouchers.find(params[:id])

    @voucher.destroy
    head :no_content
  end

  private

  def voucher_params
    params.require(:voucher).permit(:expiry_date, :value, :status, :unit_id)
  end
end
