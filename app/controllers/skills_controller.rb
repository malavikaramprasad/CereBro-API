class SkillsController < ApiController
  before_action :authenticate_user
  
  def index
    render json: Skill.all
  end
end
