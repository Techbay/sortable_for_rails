# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sortable_for_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "sortable_for_rails"
  spec.version       = SortableForRails::VERSION
  spec.authors       = ["xiongbo", "caok"]
  spec.email         = ["xiongbo027@gmail.com", "caok1231@gmail.com"]
  spec.summary       = %q{make list sortable in rails}
  spec.homepage      = "https://github.com/Techbay/sortable_for_rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 3.1"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
end
