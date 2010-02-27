$:.unshift File.expand_path(File.dirname(__FILE__) + '/lib')

require 'sinatra'
require 'rdiscount'

module Markview
  class Application < Sinatra::Base

    dir = File.dirname(File.expand_path(__FILE__))

    set :views,  "#{dir}/markview/views"
    set :public, "#{dir}/markview/static"
    
    def self.markdown_me
      ARGV[0] ||= Dir.glob("*.{md,markdown}")[0]; mdown=""
      begin
        File.open("#{ARGV[0]}", "r") { |f|
          f.each_line do |line|
            mdown += line
          end
        }
      rescue Errno::ENOENT
        raise "Failed to load README. Please specify a file."
        exit
      end
      RDiscount.new(mdown).to_html
    end

    get '/' do
      @markdown = Markview::Application.markdown_me
      erb :base
    end
  end   
end