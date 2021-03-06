# coding: utf-8

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/feishu_bot/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-feishu_bot'
  spec.version       = Fastlane::FeishuBot::VERSION
  spec.author        = 'cook'
  spec.email         = 'cook@88.com'

  spec.summary       = 'A fastlane plugin to customize your automation workflow(s) with a Feishu Bot'
  # spec.homepage      = "https://github.com/<GITHUB_USERNAME>/fastlane-plugin-feishu_bot"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # Don't add a dependency to fastlane or fastlane_re
  # since this would cause a circular dependency

  # spec.add_dependency 'your-dependency', '~> 1.0.0'

  spec.add_development_dependency('pry')
  spec.add_development_dependency('bundler')
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('rspec_junit_formatter')
  spec.add_development_dependency('rake')
  spec.add_development_dependency('rubocop', '0.49.1')
  spec.add_development_dependency('rubocop-require_tools')
  spec.add_development_dependency('simplecov')
  spec.add_development_dependency('fastlane', '>= 2.172.0')
end
