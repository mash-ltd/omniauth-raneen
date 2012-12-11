require_relative '../../../spec_helper'
require 'generators/omniauth-raneen/install_generator'

describe Omniauth::Raneen::Generators::InstallGenerator do
  destination File.expand_path("../../../../../tmp", __FILE__)

  before { prepare_destination }

  describe 'no arguments' do
    # before { run_generator  }

    # describe 'config/initializers/devise.rb' do
    #   subject { file('config/initializers/devise.rb') }
    #   it { should exist }
    #   it { should contain "#" }
    # end
  end
end