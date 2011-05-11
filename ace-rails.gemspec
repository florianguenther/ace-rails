# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ace-rails/version"

Gem::Specification.new do |s|
  s.name        = "ace-rails"
  s.version     = Ace::Rails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Florian Günther"]
  s.email       = ["mail@gee-f.de"]
  s.homepage    = "https://github.com/florianguenther/ace-rails"
  s.summary     = "Use ace (Ajax.org Cloud9 Editor) within your Rails 3 projects"
  s.description = "This gem provides a generator to download and install ace (Ajax.org Cloud9 Editor) into your Rails 3 project. It also provides some view helper to setup an editor."

  # s.rubyforge_project = "ace-rails"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
