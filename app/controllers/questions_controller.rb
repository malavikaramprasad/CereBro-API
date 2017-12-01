class QuestionsController < ApiController
  before_action :authenticate_user
  before_action :set_question, except: :create

  def create
    logger.debug params
    logger.debug params[:question]
    @question = Question.create!(QuestionParameters.new(params).permit)
    render json: @question.tag.users
  end

  def show
    render json: @question
  end

  def accept
    @question.accept! if current_user_is_tutor?
    render json: @question
  end

  def reject
    @question.reject! if current_user_is_tutor?
    render json: @question
  end

  private

  def set_question
    @question = Question.find_by_id(params[:id])
  end

  def current_user_is_learner?
    current_user == @question.learner
  end

  def current_user_is_tutor?
    current_user == @question.tutor
  end
end
