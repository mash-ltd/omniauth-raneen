# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/raneen/version'

Gem::Specification.new do |gem|
  gem.name          = "omniauth-raneen"
  gem.version       = Omniauth::Raneen::VERSION
  gem.authors       = ["Ahmad Sherif"]
  gem.email         = ["ahmad.sherif@mashsolvents.com"]
  gem.summary       = %q{An OmniAuth strategy for Raneen}
  gem.homepage      = "http://www.mashsolvents.com"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'omniauth-oauth2', '~> 1.1'
end
