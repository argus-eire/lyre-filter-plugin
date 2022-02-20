# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name        = "lyre-filter"
  spec.version     = "0.1.0"
  spec.authors     = ["Argus McIntire"]
  spec.email       = ["argus.mcintire@protonmail.com"]
  
  spec.summary     = "get this bleeding generator working"
  
  spec.files       = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(lib)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.1"
  spec.add_runtime_dependency "word_wrap", "~>1.0"
end
