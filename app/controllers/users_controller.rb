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
    render json: @user
  end
end
