module Omniauth
  module Raneen
    module Generators
      class InstallGenerator < Rails::Generators::Base
        source_root File.expand_path("../../templates", __FILE__)

        desc "Add Omniauth-Raneen config variables to the Devise initializer and generating the omniauth-raneen.yml file for config options."
        
        def copy_initializer
          template "omniauth-raneen.yml", "config/omniauth-raneen.yml"
        end

        def add_omniauth_config_options_to_initializer
          devise_initializer_path = "config/initializers/devise.rb"
          if File.exist?(devise_initializer_path)
            old_content = File.read(devise_initializer_path)

            if old_content.match(Regexp.new(/^\s# ==> Configuration for :omniauth-raneen\n/))
              false
            else
              inject_into_file(devise_initializer_path, :before => "  # ==> Configuration for any authentication mechanism\n") do
                <<-CONTENT
                  require 'omniauth-raneen'
                  # ==> Configuration for :omniauth-raneen
                  RANEEN_KEYS = YAML::load_file("#{Rails.root}/config/omniauth-raneen.yml")[Rails.env]
                  config.omniauth :raneen, RANEEN_KEYS['api_key'], RANEEN_KEYS['api_secret']
                CONTENT
              end
            end
          end
        end
      

        # def show_readme
        #   readme "README" if behavior == :invoke
        # end

      end
    end
  end
end