$LOAD_PATH.unshift File.dirname(File.expand_path(__FILE__)) + '/../lib'
require File.dirname(File.expand_path(__FILE__)) + '/../lib/markview.rb'
require 'rack/test'
require 'contest'

class RenderTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Markview.new
  end

  def should_respond_with_success
    assert last_response.ok?
  end

  def setup
    @argv = ARGV[0] = 'README.md'
  end

  def discover_file
    @argv = ARGV[0] = Dir.glob("README*")[0]
  end

  def bad_file
    @argv = ARGV[0] = "bad_file_name"
  end
end