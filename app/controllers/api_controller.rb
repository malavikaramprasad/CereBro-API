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
    # Auth Logic goes here
  end
end
