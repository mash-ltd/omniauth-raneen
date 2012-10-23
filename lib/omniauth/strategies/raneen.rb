require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Raneen < OmniAuth::Strategies::OAuth2
      option :name, 'raneen'
      option :provider_ignores_state, true

      option :client_options, {
        site: 'http://raneen.tamkeencapital.com',
        token_url: '/oauth/access_token',
        token_method: :get,
      }

      uid{ raw_info['id'] }

      info do
        {
          :name => raw_info['name'],
          :email => raw_info['email'],
          :entity_type => raw_info['entity_type'],
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/users/index').parsed
      end
    end
  end
end
