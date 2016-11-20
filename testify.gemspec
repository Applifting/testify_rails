$LOAD_PATH.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "testify/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "testify-rails"
  s.version     = Testify::VERSION
  s.authors     = [""]
  s.email       = ["info@applifting.com"]
  s.homepage    = "https://www.applifting.cz"
  s.summary     = "An E2E testing framework"
  s.description = "Rails engine containing an E2E test driver for rails app."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "Rakefile", "README.md"]
  s.require_paths = ["lib"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4"
  s.add_dependency "database_cleaner"
  s.add_dependency "factory_girl_rails"
  s.add_development_dependency "pg"
end
