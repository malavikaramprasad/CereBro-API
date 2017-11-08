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
    @current_user = User.authenticate_with_token(request.headers['X-Authorization'])
  end
end
