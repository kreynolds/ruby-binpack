# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "binpack/version"

Gem::Specification.new do |s|
  s.name        = "binpack"
  s.version     = Binpack::VERSION
  s.authors     = ["Kelley Reynolds"]
  s.email       = ["kelley.reynolds@rubyscale.com"]
  s.homepage    = ""
  s.summary     = %q{2 dimensional bin packing library}
  s.description = %q{2 dimensional bin packing library adapted from a RubyQuiz solution by Ilmari Heikkinen}

  s.rubyforge_project = "binpack"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
