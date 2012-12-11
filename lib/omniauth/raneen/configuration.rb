require 'erb'
require 'singleton'

module Omniauth
  module Raneen
    class Configuration
      include Singleton

      attr_accessor :app_secret, :app_id, :oauth_callback_url, :scope

      def initialize
        parse_config_file "config/omniauth-raneen.yml"
        @app_id ||= nil
        @app_secret ||= nil
        @oauth_callback_url ||= "http://raneen.tamkeencapital.com"
        @scope ||= "get_profile_info"
      end

      # Loads the configuration file
      # @return [nil]
      def parse_config_file(path)
        require 'ruby-debug'; debugger
        return unless File.exists?(path)
        
        conf = YAML::load(ERB.new(IO.read(path)).result)[Rails.env]
        
        conf.each do |key,value|
          self.send("#{key}=", value) if self.respond_to?("#{key}=")
        end unless conf.nil?
      end
    end
  end
end
