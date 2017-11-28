class UserMailer < ApplicationMailer
  def send_activation(email)
    mail(to: email, subject: 'Confirmation Mail', body: 'This is a confirmation mail. Please do not reply to this mail address')  
  end
end
