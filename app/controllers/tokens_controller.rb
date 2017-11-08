class TokensController < ApiController
  def create
    token = ''
    user = User.find_for_authentication(email: params[:email])
    if user.valid_password?(params[:password])
      token_payload = {
        user_id: user.email,
        exp: 1
      }
      token = JsonWebToken.encode(token_payload)
      render json: { token: token.to_s }
    else
      render json: { error: 'Password did not match' }
    end
  end
end
