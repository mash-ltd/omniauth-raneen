require 'erb'
require 'singleton'

module Omniauth
  module Raneen
    class Configuration
      include Singleton

      attr_accessor :app_secret, :app_id, :oauth_callback_url

      def initialize
        parse_config_file "config/omniauth-raneen.yml"
        @app_id ||= nil
        @app_secret ||= nil
        @oauth_callback_url ||= "http://raneen.tamkeencapital.com"
      end

      # Loads the configuration file
      # @return [nil]
      def parse_config_file(path)
        return unless File.exists?(path)
        
        conf = YAML::load(ERB.new(IO.read(path)).result)[Rails.env]
        
        conf.each do |key,value|
          self.send("#{key}=", value) if self.respond_to?("#{key}=")
        end unless conf.nil?
      end
    end
  end
end
