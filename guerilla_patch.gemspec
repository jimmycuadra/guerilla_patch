# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guerilla_patch/version'

Gem::Specification.new do |gem|
  gem.name          = "guerilla_patch"
  gem.version       = GuerillaPatch::VERSION
  gem.authors       = ["Jimmy Cuadra"]
  gem.email         = ["jimmy@jimmycuadra.com"]
  gem.description   = %q{Monkey patch objects using Ruby 2.0 refinements, if available.}
  gem.summary       = <<-SUMMARY
GuerillaPatch is a Ruby gem to ease the transition to Ruby 2.0 when redefining
behavior in existing objects (monkey patching). Ruby 2.0 introduces a new
feature called refinements which allows you to create monkey patches that
only exist in a scope where the refinement is explicitly included, preventing
your changes from affected code that has not opted in. Using GuerillaPatch,
you can use a common interface for writing a monkey patch that will use
refinements if available, working seemlessly for both Ruby 1.9 and Ruby 2.0.
SUMMARY
  gem.homepage      = "https://github.com/jimmycuadra/guerilla_patch"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency("rake")
  gem.add_development_dependency("rspec")
  gem.add_development_dependency("pry")
  gem.add_development_dependency("pry-nav")
end
