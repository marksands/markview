$LOAD_PATH.unshift File.dirname(File.expand_path(__FILE__)) + '/../lib'
require 'contest'
require 'markview'
require 'rack/test'

class RenderTest < Test::Unit::TestCase
  include Rack::Test::Methods
  
  def app
    Markview::Application.new
  end
  
  def should_respond_with_success
    assert last_response.ok?
  end
  
  def setup
    ARGV[0] = 'README.md'
  end
  
  def discover_file
    ARGV[0] = Dir.glob("README*")[0]
  end
  
  def bad_file
    ARGV[0] = "bad_file_name"
  end
end