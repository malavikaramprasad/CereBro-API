class Question < ApplicationRecord
  belongs_to :tag, class_name: 'Skill', foreign_key: :tag_id
  belongs_to :learner, class_name: 'User', foreign_key: :learner_id
  belongs_to :tutor, class_name: 'User', foreign_key: :tutor_id, optional: true

  has_many :reviews

  validates :description, presence: true
  validates :learner, uniqueness: { scope: :tutor },  unless: Proc.new { |qn| qn.tutor_id.blank? }

  def send_mail
    UserMailer.send_activation.deliver
  end
end
