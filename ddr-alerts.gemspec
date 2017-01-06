# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ddr/alerts/version'

Gem::Specification.new do |s|
  s.name          = "ddr-alerts"
  s.version       = Ddr::Alerts::VERSION
  s.authors       = ["Jim Coble"]
  s.email         = ["lib-drs@duke.edu"]
  s.summary       = %q{Alerts for the Duke Digital Repository}
  s.description   = %q{Alerts for the Duke Digital Repository}
  s.homepage      = "https://github.com/duke-libraries/ddr-alerts"
  s.license       = "BSD-3-Clause"

  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_dependency "rails", "~> 4.2"

  s.add_development_dependency "bundler", "~> 1.7"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 3.1"
  s.add_development_dependency "factory_girl_rails", "~> 4.4"
  s.add_development_dependency "database_cleaner"
end
