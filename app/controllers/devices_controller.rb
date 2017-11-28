class DevicesController < ApplicationController
  before_action :authenticate_user

  def create
    @device = current_user.devices.create!(DeviceParameters.new(params).permit)
    render json: @device
  end

  def destroy
    current_user.devices.where(id: params[:id]).first.destroy
    render json: { message: 'success' }
  end
end
