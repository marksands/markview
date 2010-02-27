Gem::Specification.new do |gemspec|
  gemspec.name = "markview"
  gemspec.summary = "A markdown viewer that renders on the fly."
  gemspec.description = "Conveniently launches markdown formatted files in a browser, rendering on the fly."
  gemspec.email = "marksands07@gmail.com"
  gemspec.homepage = "http://github.com/marksands/markview"
  gemspec.authors = ["Mark Sands"]
  gemspec.version = "0.1.1"
  gemspec.executables = ["markview"]
  gemspec.files = [
   'bin/markview',
   'lib/markview.rb',
   'lib/markview/public/style.css',
   'lib/markview/views/base.erb',
   'README.md',
   'test/render_test.rb'
  ]
  gemspec.test_files = [
    'test/render_test.rb'
  ]
  gemspec.add_dependency( 'vegas', '>=0.1.4')
  gemspec.add_dependency( 'sinatra', '>=0.9.4' )
  gemspec.add_dependency( 'rdiscount', '>=1.5.8')
  gemspec.add_development_dependency('contest', '>=0.1.2')
  gemspec.add_development_dependency('turn', '>=0.7.0')
end