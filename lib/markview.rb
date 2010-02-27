$:.unshift File.expand_path(File.dirname(__FILE__) + '/lib')

require 'sinatra'
require 'rdiscount'

module Markview
  class Application < Sinatra::Base
    
    set :views, File.dirname(File.dirname(__FILE__)) + '/markview/views'
    set :public, File.dirname(File.dirname(__FILE__)) + '/markview/static'
    set :static, true
    
    def self.markdown_me
      ARGV[0] ||= Dir.glob("*.{md,markdown}")[0];
      begin
        RDiscount.new( File.open("#{ARGV[0]}", 'r').read ).to_html
      rescue Errno::ENOENT
        raise LoadError, "Failed open document. Please specify a file."; exit
      end
    end

    get '/' do
      @markdown = Markview::Application.markdown_me
      erb :base
    end
  end   
end