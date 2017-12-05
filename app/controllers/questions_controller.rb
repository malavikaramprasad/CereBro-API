class QuestionsController < ApiController
  before_action :authenticate_user
  before_action :set_question, except: :create

  def create
    @question = Question.create!(QuestionParameters.new(params).permit)
    render json: { question: @uestion, tutors: @question.tag.users.where.not(id: current_user.id) }
  end

  def show
    render json: @question
  end

  def request_tutor
    Rails.logger.info '*********************'
    Rails.logger.info params
    Rails.logger.info '*********************'
    tutor = User.find_by_id(params[:tutor_id])

    @question.tutor = tutor if tutor.present?
    @question.start_time = Date.parse(params[:start_time]) if params.has_key?(:start_time) && params[:start_time].present?
    @question.end_time = Date.parse(params[:end_time]) if params.has_key?(:end_time) && params[:end_time].present?
    @question.save
    Rails.logger.info '*********************'
    Rails.logger.info @question.errors
    Rails.logger.info '*********************'
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
