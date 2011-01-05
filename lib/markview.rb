$:.unshift File.expand_path(File.dirname(__FILE__) + '/lib')
require 'sinatra'
require 'tempfile'
require 'github/markup'

class Markview < Sinatra::Base
  dir = File.dirname(File.expand_path(__FILE__))

  set :views,  "#{dir}/markview/views"
  set :public, "#{dir}/markview/public"
  set :static, true

  before do
    @@markup = ARGV[0] ||= Dir.glob("README*")[0]
    unless File.file?(@@markup)
      raise LoadError, "Failed to open document. Please specify a file."; exit!
    end
  end

  # Renders the html using GitHub::Markup
  def self.render
    GitHub::Markup.render(@@markup, File.read(@@markup))
  end

  get '/' do
    @markdown = Markview.render
    @title = File.basename(@@markup)
    erb :base, :layout => true
  end

  get '/edit' do
    @markdown = File.read(@@markup)
    @title = File.basename(@@markup)
    erb :edit, :layout => true
  end

  post '/save' do
    File.open(@@markup, 'w') { |f| f.write(request['markup']) }
    redirect '/'
  end

  post '/save_email' do
    return ({:error => true, :message => "Please enter a valid email address!"}).to_json if request['email'] !~ /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i
    File.open('stored_email.txt','a'){|f|f.puts request['email']}
    ({:error => false, :message => "Thanks for your interest, your email has been saved!"}).to_json
  end

end

