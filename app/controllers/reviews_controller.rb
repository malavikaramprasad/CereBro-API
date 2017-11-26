class ReviewsController < ApiController
  before_action :authenticate_user

	def create
		@review = Review.create!(ReviewParameters.new(params).permit)
		render json: @review
	end

	def index
		@review = params[:tutor_id].present? ? User.find_by_id(params[:tutor_id]).tutor_reviews : current_user.learner_reviews

		render json: @review
	end

	def show
		@review = Review.find_by_id(params[:id])
		render json: @review
	end
end
