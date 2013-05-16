# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'turbo_user_agent_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "turbo_user_agent_parser"
  spec.version       = TurboUserAgentParser::VERSION
  spec.authors       = ["Rafael Uchoa"]
  spec.email         = ["rafael@overmediacast.com"]
  spec.description   = %q{Parsing user_agents like a boss!}
  spec.summary       = %q{Parsing user_agents like a boss!}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'useragent'

  spec.add_development_dependency 'ruby-debug19'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'foreman'

  spec.add_development_dependency 'bacon', '1.1.0'
  spec.add_development_dependency 'mocha-on-bacon', '0.2.1'
  spec.add_development_dependency 'guard-bacon', '1.0.7'
  
end
