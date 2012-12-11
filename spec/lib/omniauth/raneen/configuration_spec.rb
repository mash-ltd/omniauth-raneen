require_relative '../../../spec_helper'

describe Omniauth::Raneen::Configuration do

  let(:raneen_config) { Omniauth::Raneen::Configuration.instance}

  describe "Raneen default configuration" do

    it "Should have the default values assigned correctly to the attributes" do
      raneen_config.app_id.should == nil
      raneen_config.app_secret.should == nil
      raneen_config.oauth_callback_url.should == "http://localhost:3000"
    end

    describe "Load YML configuration" do
      before :each do
        @pwd = Dir.pwd
        @tmp_dir = File.join(File.dirname(__FILE__), 'tmp')
        FileUtils.mkdir_p(@tmp_dir)
        Dir.chdir(@tmp_dir)

        conf_file = "#{File.dirname(__FILE__)}/tmp/omniauth-raneen.yml"

        f = File.new("omniauth-raneen.yml", 'w')
        doc = %Q{
          test:
            oauth_callback_url: "http://raneen.tamkeencapital.com"
        }
        f.puts(doc)
        f.close

        raneen_config.parse_config_file(conf_file)
      end

      it "should hold the correct data loaded from the yml" do
        raneen_config.oauth_callback_url.should == "http://raneen.tamkeencapital.com"
      end

      after do
        Dir.chdir(@pwd)
        FileUtils.rm_rf(@tmp_dir)
      end
    end

  end


end