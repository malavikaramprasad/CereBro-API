class QuestionsController < ApiController
  before_action :authenticate_user

  def create
    @question = Question.create!(QuestionParameters.new(params).permit)
    render json: @question
  end

  def show
    @question = Question.find_by_id(params[:id])
    render json: @question
  end
end
