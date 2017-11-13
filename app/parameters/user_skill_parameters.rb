class UserSkillParameters < ActionParameter::Base
  def root_key
    :user_skills
  end

  def permit
    params.require(root_key).permit(default_params)
  end

  def default_params
    [:skills => []]
  end
end