class PushNotifier
  def self.notify(users, data)
    notification_data = { data: { call: NotificationSerializer.new(data).to_json }}
    registration_tokens = []
    users.each do |x|
      registration_tokens << x.devices.last.try(:token)
    end

    raise Errors::CustomError.new 'Registration IDs are empty' if registration_tokens.blank?

    fcm = FCM.new(Rails.application.secrets.fcm_api_key)
    response = fcm.send(registration_tokens.compact, notification_data)
    Rails.logger.info response
  end
end
