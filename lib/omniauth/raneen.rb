require_relative 'raneen/version'
require "rails"
require_relative 'raneen/configuration'
require_relative 'raneen/railtie'
require_relative '../generators/omniauth-raneen/install_generator'

module Omniauth
  module Raneen

    def self.configuration
      Omniauth::Raneen::Configuration.instance
    end
  end
end

require_relative 'strategies/raneen'