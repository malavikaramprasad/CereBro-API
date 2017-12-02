class UserParameters < ActionParameter::Base
  def root_key
    :user
  end

  def permit
    params.require(root_key).permit(default_params)
  end

  def permit_edit
    params.require(root_key).permit(edit_params)
  end

  def default_params
    [:first_name, :last_name, :email, :password, :password_confirmation, :x_coordinate, :y_coordinate, :start_time, :end_time]
  end

  def edit_params
    [:first_name, :last_name, :x_coordinate, :y_coordinate, :start_time, :end_time]
  end
end
