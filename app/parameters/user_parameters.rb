class UserParameters < ActionParameter::Base
  def permit
    params.permit(default_params)
  end

  def default_params
    [:first_name, :last_name, :email, :password, :password_confirmation]
  end
end