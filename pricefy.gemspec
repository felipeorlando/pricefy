require_relative 'lib/pricefy/version'

Gem::Specification.new do |spec|
  spec.name          = "pricefy"
  spec.version       = Pricefy::VERSION
  spec.authors       = ["Felipe Orlando"]
  spec.email         = ["fobsouza@gmail.com"]

  spec.summary       = %q{A Ruby gem for price manipulation and formatting}
  spec.description   = %q{Pricefy provides utilities for handling prices, formatting, and calculations in Ruby applications.}
  spec.homepage      = "https://github.com/felipeorlando/pricefy"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 3.1.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/felipeorlando/pricefy"
  spec.metadata["changelog_uri"] = "https://github.com/felipeorlando/pricefy/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
