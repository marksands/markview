Markview
========

Markview allows you to view markdown formatted files in a slick way. Markview is
inspired by the python library [restview](http://mg.pov.lt/restview/). This gem
is made possible by [Ryan Tomayko](http://github.com/rtomayko)'s [RDiscount](http://github.com/rtomayko/rdiscount) and
[samsoffes](http://github.com/samsoffes) and his brilliant [markdownr](http://github.com/samsoffes/markdownr.com).

Install
-------

New releases of Markview are published to [gemcutter](http://gemcutter.org/gems/markview)

	$ [sudo] gem install markview

Usage
-----

Markview is very simple to use. Run the gem from the command line and specify
the README. Markview is smart enough to find the README if you choose not to
specify the file.

	$ markview README.md
	
This will probably also help.

	$ markview --help
	Usage: markview [options]
	Vegas options:
	  -K, --kill               kill the running process and exit
	  -S, --status             display the current running PID and URL then quit
	  -s, --server SERVER      serve using SERVER (thin/mongrel/webrick)
	  -o, --host HOST          listen on HOST (default: 0.0.0.0)
	  -p, --port PORT          use PORT (default: 5678)
	  -e, --env ENVIRONMENT    use ENVIRONMENT for defaults (default: development)
	  -F, --foreground         don't daemonize, run in the foreground
	  -L, --no-launch          don't launch the browser
	  -d, --debug              raise the log level to :debug (default: :info)
	      --app-dir APP_DIR    set the app dir where files are stored (default: ~/.vegas/markview)/)
	  -P, --pid-file PID_FILE  set the path to the pid file (default: app_dir/markview.pid)
	      --log-file LOG_FILE  set the path to the log file (default: app_dir/markview.log)
	      --url-file URL_FILE  set the path to the URL file (default: app_dir/markview.url)
	Common options:
	  -h, --help               Show this message
	      --version            Show version
	
Preview
-------

![Markview Preview](http://img.skitch.com/20100225-gt6h7nqqt281hhx4d1qstu7cqm.png)
	
Author
------

[Mark Sands](http://github.com/marksands) :: marksands07@gmail.com