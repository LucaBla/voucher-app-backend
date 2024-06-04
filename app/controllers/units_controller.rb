class UnitsController < ApplicationController
  before_action :authenticate_devise_api_token!

  def index
    @units = current_devise_api_user.units.all
    render json: @units
  end

  def create
    @unit = current_devise_api_user.units.new(unit_params)

    if @unit.save
      render json: @unit, status: :created
    else
      render json: @unit.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @unit = current_devise_api_user.units.find(params[:id])

    @unit.destroy
    head :no_content
  end

  private

  def unit_params
    params.require(:unit).permit(:name)
  end
end
