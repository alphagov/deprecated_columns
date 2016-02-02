# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "deprecated_columns/version"

Gem::Specification.new do |spec|
  spec.name          = "deprecated_columns"
  spec.version       = DeprecatedColumns::VERSION
  spec.authors       = ["Ben Lovell"]
  spec.email         = ["benjamin.lovell@gmail.com"]

  spec.summary       = %q{Active Record compliant column/attribute deprecator}
  spec.description   = %q{Mark column(s) for deprecation to permit subtractive schema changes in production.}
  spec.homepage      = "https://github.com/alphagov/deprecated_columns"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.0.0"

  spec.add_dependency "rails", ">= 4.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "gem_publisher", "~> 1.1.1"
end
