# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kinabo/version'

Gem::Specification.new do |spec|
  spec.name          = "kinabo"
  spec.version       = Kinabo::VERSION
  spec.authors       = ["Noverde Team", "Rafael Izidoro"]
  spec.email         = ["dev@noverde.com.br", "izidoro.rafa@gmail.com"]

  spec.summary       = %q{Generate CNAB (Centro Nacional Automação Bancária) files}
  spec.description   = %q{This gem is responsible for generates cnabs files for main Brazilian banks}
  spec.homepage      = "https://github.com/noverde/kinabo"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "hashie", "~> 3.5"
  spec.add_dependency "activesupport", "~> 5.0"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry-byebug", "~> 3.4.2"
end
