class Question < ApplicationRecord
  ACCEPT_TEXT = "Your tutor has accepted your request"
  REJECT_TEXT = "Your tutor has declined your request"
  REQUEST_TEXT = "A learner has requested for a session"

  ACCEPT_SUBJECT = "Yay! Your Tutor has accepted your request"
  REJECT_SUBJECT = "Oops! Your request was declined"
  REQUEST_SUBJECT = "Hola! Someone has requested for a session."


  belongs_to :tag, class_name: 'Skill', foreign_key: :tag_id
  belongs_to :learner, class_name: 'User', foreign_key: :learner_id, optional: true
  belongs_to :tutor, class_name: 'User', foreign_key: :tutor_id, optional: true

  has_many :reviews

  validates :description, presence: true

  after_save :send_mail, :send_accepted_mail, :send_tutor_notification, if: Proc.new { |obj| obj.tutor_id_changed? }


  # after_create :send_mail

  def send_tutor_notification
    message = "You have been requested to answer a question"
    PushNotifier::notify(message, self)
  end

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
    update(tutor_accepted: true)
    send_accepted_mail
  end

  def reject!
    update(tutor_accepted: false)
    send_rejected_mail
  end
end
