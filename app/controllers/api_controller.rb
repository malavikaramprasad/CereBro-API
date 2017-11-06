class ApiController < ActionController::API
  around_action :catch_exceptions
  protected

  def catch_exceptions
    begin
      yield
    rescue Exception => e
      render json: { error: { code: 400, message: e.message }}
    end
  end

  def authenticate_user
    # Devise::Strategies::JwtAuthenticatable.authenticate!
    resource = warden.authenticate!(scope: :user)
    sign_in(:user, resource)
  end
end
