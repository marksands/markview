$:.unshift File.expand_path(File.dirname(__FILE__) + '/lib')

require 'sinatra'
require 'rdiscount'

module Markview
  class Application < Sinatra::Base

    set :views, File.expand_path(File.dirname(__FILE__)) + '/views'
    set :public, File.expand_path(File.dirname(__FILE__)) + '/static'

    def markdown_me
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
      @markdown = markdown_me
      erb :base
    end
  end   
end