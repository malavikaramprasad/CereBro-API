class UsersController < ApiController
  before_action :authenticate_user, except: :create

  def index
    render json: User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    render json: @user
  end

  def create
    @user = User.create!(UserParameters.new(params).permit)
    token_payload = {
        user_id: user.email,
        exp: 1
      }
      token = JsonWebToken.encode(token_payload)
    render json: { token: token.to_s }
  end
end
