$:.unshift File.expand_path(File.dirname(__FILE__) + '/lib')

require 'sinatra'
require 'rdiscount'

module Markview
  class Application < Sinatra::Base
    dir = File.dirname(File.expand_path(__FILE__))
    
    set :views,  "#{dir}/markview/views"
    set :public, "#{dir}/markview/public" 
    set :static, true
    
    def self.markdown_me
      ARGV[0] ||= Dir.glob("*.{md,markdown}")[0]; mdown=""
      begin
        RDiscount.new( File.open("#{ARGV[0]}", 'r').read ).to_html
      rescue Errno::ENOENT
        raise "Failed to load README. Please specify a file."; exit
      end
    end

    get '/' do
      @markdown = Markview::Application.markdown_me
      erb :base
    end
  end   
end