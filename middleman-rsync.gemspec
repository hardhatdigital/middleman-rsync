# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "middleman-rsync"
  s.version     = "0.0.2"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Andrew Buntine", "David Cristofaro"]
  s.email       = ["bunts@hhd.com.au", "david@dtcristo.com"]
  s.homepage    = "https://github.com/hardhatdigital/middleman-rsync"
  s.summary     = %q{A Middleman extension to deploy via rsync}
  # s.description = %q{A longer description of your extension}
  s.license     = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency("middleman-core", ["~> 4.0"])
end
