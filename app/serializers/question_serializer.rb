class QuestionSerializer < BaseSerializer
  attributes :description, :start_time, :end_time
  has_one :learner, serializer: UserSerializer
  has_one :tutor, serializer: UserSerializer
  has_one :tag, serializer: SkillSerializer
end
