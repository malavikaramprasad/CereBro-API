class QuestionParameters < ActionParameter::Base
  def root_key
    :question
  end

  def permit
    params.require(root_key).permit(default_params)
  end

  def default_params
    [:learner_id, :tag_id, :description]
  end
end