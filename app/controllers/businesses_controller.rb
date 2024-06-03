class BusinessesController < ApplicationController
  before_action :authenticate_devise_api_token!

  def show
    @business = current_devise_api_user
    render json: @business, include: [:units]
  end

  def update
    @business = current_devise_api_user
    if @business.update(business_params)
      render json: @business
    else
      render json: @business.errors, status: :unprocessable_entity
    end
  end

  private

  def business_params
    params.require(:business).permit(:name, :phone_number, :email, :location, :street, :apt_suite_bldg, :city, :state, :zip_code, :country)
  end

end
