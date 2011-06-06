# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rails_avahi_publisher/version"

Gem::Specification.new do |s|
  s.name        = "rails_avahi_publisher"
  s.version     = RailsAvahiPublisher::VERSION
  s.authors     = ["Chris Parker"]
  s.email       = ["mrcsparker@gmail.com"]
  s.homepage    = "https://github.com/mrcsparker/rails_avahi_publisher"
  s.summary     = %q{Avahi publishing daemon for your rails apps}
  s.description = %q{Avahi publishing daemon for your rails apps}

  s.rubyforge_project = "rails_avahi_publisher"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "daemons"
  s.add_runtime_dependency "ruby-dbus"

  s.add_development_dependency 'rails', '~> 3.0'
  s.add_development_dependency 'rspec', '~> 2.0'
  s.add_development_dependency 'rake'
end
