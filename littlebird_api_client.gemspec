# coding: utf-8
# USAGE
# gem build littlebird_api_client.gemspec 
# gem push littlebird_api_client-0.1.3.gem
# Rubygems.org may request your username/password here - currently Devin is the only author, so this needs to be updated for permissions in order for others to push
Gem::Specification.new do |spec|
  spec.name          = "littlebird_api_client"
  spec.version       = '0.1.3'
  spec.authors       = ["Devin Gaffney"]
  spec.email         = ["devin@getlittlebird.com"]
  spec.summary       = %q{A thin wrapper for the Little Bird api (http://api.getlittlebird.com/index.html)}
  spec.description   = %q{For use with Little Bird! Ya goof!}
  spec.homepage      = ""
  spec.license       = "Proprietary"
  spec.files         = `git ls-files -z`.split("\x0")
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
