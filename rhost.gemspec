require_relative "./lib/rhost/version"

Gem::Specification.new do |s|
  s.name        = "rhost"
  s.version     = Rhost::VERSION
  s.authors     = ["Adam Cooke"]
  s.email       = ["opensource@adamcooke.io"]
  s.homepage    = "http://adamcooke.io"
  s.licenses    = ['MIT']
  s.summary     = "A complete blogging engine for Rails applications"
  s.description = "A complete engine for managing blog posts and presenting them in your Rails applications."

  s.files = Dir["{app,config,db,doc,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 4.2.3", "< 5.0"
  s.add_dependency "jquery-rails", ">= 4.0", "< 5"
  s.add_dependency "coffee-rails", ">= 4.1", "< 5"
  s.add_dependency "sass-rails", ">= 5.0", "< 6"
  s.add_dependency "uglifier", ">= 2.7", "< 3"

  s.add_development_dependency 'sqlite3', '~> 1.3'

end
