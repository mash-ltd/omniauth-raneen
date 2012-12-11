require "omniauth-raneen"
# require "rails"

module Omniauth
  module Raneen
    module Rails3
      if defined?(Rails::Railtie)
        class Railtie < Rails::Railtie

          initializer :load_raneen_omniauth_config do 
            ::Omniauth::Raneen::Configuration.instance.setup_omniauth_client
          end
        end
      end
    end  
  end
end
