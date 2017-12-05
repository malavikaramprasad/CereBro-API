class UserSerializer < BaseSerializer
  attributes :first_name, :last_name, :email, :rating, :x_coordinate, :y_coordinate, :start_time, :end_time
  has_many :booked_slots, serializer: QuestionSlotSerializer

  # def booked_slots
  #   object.tutor_questions.where("start_time > ?", DateTime.now)
  # end
end
