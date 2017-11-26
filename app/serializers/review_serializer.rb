class ReviewSerializer < BaseSerializer
  attributes :rating, comment, question_id, :name

  def name
    object.question.learner.first_name + object.question.learner.last_name
  end
end
