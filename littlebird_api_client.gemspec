# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
puts lib
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
Gem::Specification.new do |spec|
  spec.name          = "littlebird_api_client"
  spec.version       = '0.1.1'
  spec.authors       = ["Devin Gaffney"]
  spec.email         = ["devin@getlittlebird.com"]
  spec.summary       = %q{A thin wrapper for the Little Bird api (http://api.getlittlebird.com/index.html)}
  spec.description   = %q{For use with Little Bird! Ya goof!}
  spec.homepage      = ""
  spec.license       = "Proprietary"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
