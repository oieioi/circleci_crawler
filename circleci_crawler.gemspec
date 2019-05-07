lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "circleci_crawler/version"

Gem::Specification.new do |spec|
  spec.name          = "circleci_crawler"
  spec.version       = CircleciCrawler::VERSION
  spec.authors       = ["oieioi"]
  spec.email         = ["atsuinatsu.samuifuyu@gmail.com"]

  spec.summary       = "t"
  spec.description   = "t"
  spec.homepage      = "https://github.com/oieioi/circleci_crawler"
  spec.license       = "MIT"
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  #spec.add_dependency "activesupport"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  #spec.add_development_dependency "byebug"
  #spec.add_development_dependency "rubocop"
end
