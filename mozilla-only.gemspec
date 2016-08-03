# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mozilla/only/version'

Gem::Specification.new do |spec|
  spec.name          = "mozilla-only"
  spec.version       = Mozilla::Only::VERSION
  spec.authors       = ["sven"]
  spec.email         = ["sven199109@gmail.com"]

  spec.summary       = %q{A rack middleware only permit mozilla firefox request.}
  spec.description   = %q{See summary.}
  spec.homepage      = "https://github.com/sven199109/mozilla-only.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rack", "~> 2.0.1"
  spec.add_development_dependency "useragent", "~> 0.16"
  spec.add_runtime_dependency "useragent", "~> 0.16"
end
