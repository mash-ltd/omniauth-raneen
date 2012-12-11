require "omniauth-raneen"

module Omniauth
  module Raneen
    module Rails3
      if defined?(Rails::Railtie)
        class Railtie < Rails::Railtie

          initializer :load_raneen_omniauth_config do 
            ::Omniauth::Raneen::Configuration.instance
          end
        end
      end
    end  
  end
end
