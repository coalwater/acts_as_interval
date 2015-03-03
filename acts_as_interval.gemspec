$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "acts_as_interval/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "acts_as_interval"
  s.version     = ActsAsInterval::VERSION
  s.authors     = ["Mohammad AbuShady"]
  s.email       = ["mohammad@abushady.com"]
  s.homepage    = "https://github.com/coalwater/acts_as_interval"
  s.summary     = "Summary of ActsAsInterval."
  s.description = "Description of ActsAsInterval."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENCE.md", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.1"
  s.add_dependency "mysql2", "~> 0.3"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "faker"
end
