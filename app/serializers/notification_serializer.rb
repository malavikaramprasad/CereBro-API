class NotificationSerializer < BaseSerializer
  attributes :description, :learner_name

  def learner_name
    object.learner.first_name + " " + object.learner.last_name
  end
end
