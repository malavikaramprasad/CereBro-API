class UserParameters < ActionParameter::Base
  def root_key
    :user
  end

  def permit
    pparams.require(root_key).permit(default_params)
  end

  def default_params
    [:first_name, :last_name, :email, :password, :password_confirmation]
  end
end