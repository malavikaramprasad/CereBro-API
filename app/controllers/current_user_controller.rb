class CurrentUserController < ApiController
  before_action :authenticate_user

  def add_skills
    @current_user.add_skills(UserSkillParameters.new(params).permit[:skills])
    head :ok, content_type: "application/json"
  end

  def skills
    render json: @current_user.skills
  end
end
