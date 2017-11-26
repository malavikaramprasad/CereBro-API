class ReviewParameters < ActionParameter::Base
  def root_key
    :review
  end

  def permit
    params.require(root_key).permit(default_params)
  end

  def default_params
    [:question_id, :rating, :comment]
  end
end