class UserMailer < ApplicationMailer
  def send_activation(email,body,subject )
    mail(to: email, subject: subject, body: body)  
  end

end
