Gem::Specification.new do |s|
  s.name = "markview"
  s.version = "0.0.1"
  s.date = "2/24/2010"
  s.authors = ["Mark Sands"]
  s.email = "marksands07@gmail.com"
  s.summary = "A markdown viewer that renders on the fly."
  s.homepage = "http://github.com/marksands/markview"
  s.executables = ["markview"]
  s.files = [
    'README.md',
    'lib/markview.rb',
    'lib/static/style.css',
    'lib/views/base.erb'
  ]
  s.add_dependency( 'vegas', '>=0.1.2')
  s.add_dependency( 'sinatra', '>=0.9.4')
  s.add_dependency( 'rdiscount', '>=1.5.8')
end