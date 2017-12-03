class PushNotifier
  def self.notify(message, data)
    notification_data = { data: { message: message, question: QuestionSerializer.new(data).to_json }}

    registration_token = data.tutor.devices.last.try(:token)

    raise Errors::CustomError.new 'Registration IDs are empty' if registration_token.blank?

    fcm = FCM.new(Rails.application.secrets.fcm_api_key)
    response = fcm.send(registration_token, notification_data)
    Rails.logger.info response
  end
end
