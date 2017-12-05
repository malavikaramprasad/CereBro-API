class PushNotifier
  def self.notify(message, data)
    notification_data = { data: { message: message, question_id: data.id, question: QuestionSerializer.new(data).to_json }}

    registration_tokens = [data.tutor.devices.last.try(:token)]

    raise Errors::CustomError.new 'Registration IDs are empty' if registration_tokens.blank?

    fcm = FCM.new(ENV['FCM_API_KEY'])
    response = fcm.send(registration_tokens, notification_data)
    Rails.logger.info response
  end
end
