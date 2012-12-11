require "omniauth-raneen"

module Omniauth
  module Raneen
    module Rails3
      if defined?(Rails::Railtie)
        class Railtie < Rails::Railtie

          initializer :load_raneen_omniauth_config do 
            conf = ::Omniauth::Raneen::Configuration.instance
            Devise.setup do |config|
              require 'omniauth-raneen'
              config.omniauth :raneen, conf.app_id, conf.app_secret, scope: conf.scope, strategy_class: Omniauth::Raneen::Strategies::Raneen
            end
          end
        end
      end
    end  
  end
end
