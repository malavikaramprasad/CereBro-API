class CurrentUserController < ApiController
  before_action :authenticate_user

  def show
    render json: @current_user
  end

  def update
    current_user.update(params)
  end

  def requests
    render json: { accepted: @current_user.tutor_questions.where(tutor_accepted: true) ,pending: @current_user.tutor_questions.where(tutor_accepted: false)}
  end

  def add_skills
    @current_user.add_skills(UserSkillParameters.new(params).permit[:skills])
    head :ok, content_type: "application/json"
  end

  def skills
    render json: @current_user.skills
  end

  def add_preferred_location
    @current_user.preferred_locations.create!(name: params[:location][:name], x_coordinate: params[:location][:x_coordinate], y_coordinate: params[:location][:y_coordinate])
    render json: @current_user
  end
end
