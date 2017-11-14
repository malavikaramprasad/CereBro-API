class QuestionsController < ApiController
  before_action :authenticate_user

  def create
    binding.pry
    # @user = User.create!(UserParameters.new(params).permit)
    @question = Question.create!(QuestionParameters.new(params).permit)
    render json: @question
  end

  def show
    @question = Question.find_by_id(params[:id])
    render json: @question
  end
end
