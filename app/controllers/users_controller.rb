class UsersController < ApiController
  before_action :authenticate_user, except: :create

  def index
    if params[:skill].present?
      @skill = Skill.find_by_name(params[:skill])
      raise Errors::CustomError.new 'Skill not found' if @skill.blank?
      render json: @skill.users
    else
      render json: User.all
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    render json: @user
  end

  def create
    @user = User.create!(UserParameters.new(params).permit)
    token_payload = {
      user_id: @user.email,
      exp: 1
    }
    token = JsonWebToken.encode(token_payload)
    render json: { token: token.to_s }
  end
end
