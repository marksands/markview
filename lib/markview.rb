$:.unshift File.expand_path(File.dirname(__FILE__) + '/lib')

require 'sinatra'
require 'github/markup'
require 'rdiscount'

module Markview
  class Application < Sinatra::Base    
    dir = File.dirname(File.expand_path(__FILE__))
    
    set :views,  "#{dir}/markview/views"
    set :public, "#{dir}/markview/public"
    set :static, true
        
    # Renders the html using GitHub::Markup
    def self.markdown_me
      ARGV[0] ||= Dir.glob("README*")[0]
      begin
        RDiscount.new(GitHub::Markup.render(ARGV[0], File.read(ARGV[0]))).to_html
      rescue Errno::ENOENT
        raise LoadError, "Failed to open document. Please specify a file."; exit
      end
    end

    get '/' do
      @markdown = Application.markdown_me
      @title = ARGF.filename.gsub(/(.+\/)?/, '') # /path/to/README.txt => README.txt
      erb :base
    end
  end   
end