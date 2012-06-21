# -*- encoding: utf-8 -*-
#
# Christophe Hamerling - Linagora
#
Gem::Specification.new do |s|

  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.5'

  s.authors       = ["Christophe Hamerling"]
  s.email         = ["christophe.hamerling@linagora.com"]
  s.description   = %q{Manage Play services from the command line}
  s.summary       = %q{This gem provides a binary 'playit' used to manage Play FP7 services from the command line}
  s.homepage      = "http://chamerling.github.com/playit/"

  s.files         = `git ls-files`.split($\)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.name          = "playit"
  s.require_paths = ["lib"]
  s.version       = "0.0.1"

  s.add_dependency('multi_json', "~> 1.0.3")

  # Input stream management
  s.add_dependency('highline', "~> 1.6.13")

  s.add_development_dependency('mocha', "~> 0.11.4")
  s.add_development_dependency('rake', "~> 0.9.2")

  ## Leave this section as-is. It will be automatically generated from the
  ## contents of your Git repository via the gemspec task. DO NOT REMOVE
  ## THE MANIFEST COMMENTS, they are used as delimiters by the task.
  # = MANIFEST =
  s.files = %w[
    Gemfile
    Gemfile.lock
    LICENSE
    README.md
    Rakefile
    bin/playit
    lib/playit.rb
    lib/playit/command.rb
    lib/playit/config.rb
    lib/playit/platform.rb
    lib/playit/services/bootstrap.rb
    lib/playit/services/governance.rb
    lib/playit/services/metadata.rb
    playit.gemspec
  ]
  # = MANIFEST =

end
