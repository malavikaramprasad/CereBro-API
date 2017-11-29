class Question < ApplicationRecord
  ACCEPT_TEXT = "Your tutor has accepted your request"
  REJECT_TEXT = "Your tutor has declined your request"
  REQUEST_TEXT = "A learner has requested for a session"

  ACCEPT_SUBJECT = "Yay! Your Tutor has accepted your request"
  REJECT_SUBJECT = "Oops! Your request was declined"
  REQUEST_SUBJECT = "Hola! Someone has requested for a session."


  belongs_to :tag, class_name: 'Skill', foreign_key: :tag_id
  belongs_to :learner, class_name: 'User', foreign_key: :learner_id
  belongs_to :tutor, class_name: 'User', foreign_key: :tutor_id, optional: true

  has_many :reviews

  validates :description, presence: true
  validates :learner, uniqueness: { scope: :tutor },  unless: Proc.new { |qn| qn.tutor_id.blank? }

  after_create :send_mail

  def send_mail
    UserMailer.send_activation(tutor.email,REQUEST_TEXT,REQUEST_SUBJECT).deliver
  end

  def send_accepted_mail
    UserMailer.send_activation(learner.email,ACCEPT_TEXT,ACCEPT_SUBJECT).deliver
  end

  def send_rejected_mail
    UserMailer.send_activation(learner.email,REJECT_TEXT,REJECT_SUBJECT).deliver
  end

  def accept!
    tutor_accepted = true
    save!
    send_accepted_mail
  end

  def reject!
    tutor_accepted = false
    save!
    send_rejected_mail
  end
end
