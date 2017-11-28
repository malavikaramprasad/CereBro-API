class Question < ApplicationRecord
  belongs_to :tag, class_name: 'Skill', foreign_key: :tag_id
  belongs_to :learner, class_name: 'User', foreign_key: :learner_id
  belongs_to :tutor, class_name: 'User', foreign_key: :tutor_id, optional: true

  validates :description, presence: true

  def send_mail
    UserMailer.send_activation(tutor.email).deliver
  end
end
