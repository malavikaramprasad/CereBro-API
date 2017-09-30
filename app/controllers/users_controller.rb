class UsersController < ApiController
  before_action :authenticate_user, only: :show

  # Contains User Api Endpoints

  def index
    render json: User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    render json: @user
  end
end
