module Devise
  module Strategies
    class JwtAuthenticatable < Base
      def valid?
        request.headers['X-Authorization'].present?
      end

      def authenticate!
        return fail! unless claims
        return fail! unless claims.has_key?('user_id')

        success! User.first claims['user_id']
      end

      protected

      def claims
        strategy, token = request.headers['X-Authorization'].split(' ')

        return nil if (strategy || '').downcase != 'bearer'

        JWTWrapper.decode(token) rescue nil
      end
    end
  end
end