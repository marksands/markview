Gem::Specification.new do |gemspec|
  gemspec.name = "markview"
  gemspec.summary = "A markup viewer that renders on the fly in your browser."
  gemspec.description = "Coneveniently renders and launches any markup formatted file within your browser."
  gemspec.email = "marksands07@gmail.com"
  gemspec.homepage = "http://github.com/marksands/markview"
  gemspec.authors = ["Mark Sands"]
  gemspec.version = "0.3.0"
  gemspec.executables = ["markview"]
  gemspec.files = [
   	'bin/markview',
   	'lib/markview.rb',
   	'lib/markview/public/style.css',
   	'lib/markview/public/jquery.notifyBar.css',
   	'lib/markview/public/app.js',
   	'lib/markview/public/jquery.notifyBar.js',
   	'lib/markview/views/base.erb',
   	'lib/markview/views/layout.erb',
   	'README.md',
   	'test/test_helper.rb',
   	'test/render_test.rb'
  ]
  gemspec.test_files = [
    'test/test_helper.rb',
    'test/render_test.rb'
  ]
  gemspec.add_dependency( 'vegas', '>=0.1.4')
  gemspec.add_dependency( 'sinatra', '>=0.9.4' )
  gemspec.add_dependency( 'github-markup', '>=0.2.2')
  gemspec.add_dependency( 'rdiscount', '>=1.6.3')
  gemspec.add_dependency( 'json', '>=1.4.6')

  gemspec.add_development_dependency('contest', '>=0.1.2')
  gemspec.add_development_dependency('turn', '>=0.7.0')
  gemspec.add_development_dependency('rack-test', '>=0.5.3')

  gemspec.rubyforge_project = 'markview'
  gemspec.rubygems_version = '0.3.0'
end