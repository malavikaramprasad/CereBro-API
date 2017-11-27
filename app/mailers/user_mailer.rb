class UserMailer < ApplicationMailer
  def send_activation
    mail(to: 'vsivas2@uic.edu', subject: 'Confirmation Mail', body: 'This is a confirmation mail. Please do not reply to this mail address')  
  end
end
