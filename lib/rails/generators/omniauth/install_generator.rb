module Omniauth
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Add Omniauth-Raneen config variables to the Devise initializer and generating the omniauth-raneen.yml file for config options."
      
      def copy_initializer
        template "omniauth-raneen.yml", "config/omniauth-raneen.yml"
      end
      
    end   
  end
end