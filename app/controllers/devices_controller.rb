class DevicesController < ApplicationController
  before_action :authenticate_user

  def create
    @device = current_user.devices.create!(DeviceParameters.new(params).permit)
    render json: @device
  end
end
