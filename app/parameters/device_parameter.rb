class DeviceParameters < ActionParameter::Base
  def root_key
    :device
  end

  def permit
    params.require(root_key).permit(default_params)
  end

  def default_params
    [:token, :uid, :platform, :os_version]
  end
end