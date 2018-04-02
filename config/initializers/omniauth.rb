require 'omniauth-oauth2'
require 'base64'
require 'rack/utils'

module OmniAuth
  module Strategies
    class Reddit < OmniAuth::Strategies::OAuth2
      option :name, "reddit"
      option :authorize_options, %i[scope state duration]

      option :client_options, {
        site: 'https://oauth.reddit.com',
        token_url: 'https://ssl.reddit.com/api/v1/access_token'
      }

      uid { raw_info['id'] }

      info do
        {
          name: raw_info['name']
        }
      end

      extra do
        {'raw_info' => raw_info}
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/me').parsed || {}
      end

protected

      def build_access_token
        # Rails.logger.debug "Omniauth build access token"
        # ap options
        options.token_params.merge!(
          :headers => {'Authorization' => basic_auth_header },
          :redirect_uri => ENV.fetch('REDDIT_CALLBACK_URL')
        )
        # ap options.token_params
        super
      end

      def basic_auth_header
        "Basic " + Base64.strict_encode64("#{options[:client_id]}:#{options[:client_secret]}")
      end

      MOBILE_USER_AGENTS =  'webos|ipod|iphone|mobile'

      def request_phase
        options[:client_options].authorize_url = mobile_request? ? 'https://ssl.reddit.com/api/v1/authorize.compact' : 'https://ssl.reddit.com/api/v1/authorize'
        super
      end

      def mobile_request?
        ua = Rack::Request.new(@env).user_agent.to_s
        ua.downcase =~ Regexp.new(MOBILE_USER_AGENTS)
      end

    end
  end
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :reddit,
    ENV.fetch('REDDIT_API_KEY'),
    ENV.fetch('REDDIT_SECRET'),
    { scope: 'identity', duration: 'temporary' }
end
