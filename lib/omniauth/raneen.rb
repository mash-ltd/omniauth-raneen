require "rails"
require_relative 'raneen/version'
require_relative 'raneen/configuration'
require_relative 'raneen/railtie'

module Omniauth
  module Raneen

    def self.configuration
      Omniauth::Raneen::Configuration.instance
    end
  end
end

require_relative 'strategies/raneen'