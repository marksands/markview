Gem::Specification.new do |gemspec|
  gemspec.name = "markview"
  gemspec.summary = "A markdown viewer that renders on the fly."
  gemspec.description = "A markdown viewer that renders on the fly."
  gemspec.email = "marksands07@gmail.com"
  gemspec.homepage = "http://github.com/marksands/markview"
  gemspec.authors = ["Mark Sands"]
  gemspec.version = "0.1.0"
  gemspec.executables = ["markview"]
  gemspec.files = [
   'bin/markview',
   'lib/markview.rb',
   'lib/static/style.css',
   'lib/views/base.erb',
   'README.md'
  ]
  gemspec.add_dependency( 'vegas', '>=0.1.4')
  gemspec.add_dependency( 'sinatra', '>=0.9.4' )
  gemspec.add_dependency( 'rdiscount', '>=1.5.8')
end