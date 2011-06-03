# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rails_avahi_publisher/version"

Gem::Specification.new do |s|
  s.name        = "rails_avahi_publisher"
  s.version     = RailsAvahiPublisher::VERSION
  s.authors     = ["Chris Parker"]
  s.email       = ["mrcsparker@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "rails_avahi_publisher"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
