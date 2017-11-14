class QuestionSerializer < ActiveModel::Serializer
  has_one :learner, serializer: UserSerializer
  has_one :tutor, serializer: UserSerializer

end
