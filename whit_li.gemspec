# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "whit_li/version"

Gem::Specification.new do |s|
  s.name        = "whit_li"
  s.version     = WhitLi::VERSION
  s.authors     = ["Sergey Efremov"]
  s.email       = ["sergey.efremov@resumup.com"]
  s.homepage    = ""
  s.summary     = "Whit.li Ruby wrapper"
  s.description = "Whit.li Ruby wrapper"

  s.rubyforge_project = "whit_li"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_dependency(%q<multi_json>, [">= 0"])
  s.add_dependency(%q<hashie>, [">= 0"])
  s.add_dependency(%q<rest-client>, [">= 0"])
end
