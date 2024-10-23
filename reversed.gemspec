require_relative "lib/reversed/version"

Gem::Specification.new do |spec|
  spec.name          = "reversed"
  spec.version       = Reversed::VERSION
  spec.summary       = "Reverse DNS / IP Lookup for Ruby"
  spec.homepage      = "https://github.com/ankane/reversed"
  spec.license       = "MIT"

  spec.author        = "Andrew Kane"
  spec.email         = "andrew@ankane.org"

  spec.files         = Dir["*.{md,txt}", "{lib}/**/*"]
  spec.require_path  = "lib"

  spec.required_ruby_version = ">= 3.1"

  spec.add_dependency "net-dns", ">= 0.20"
end
