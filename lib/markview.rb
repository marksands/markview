$:.unshift File.expand_path(File.dirname(__FILE__) + '/lib')
require 'sinatra'
require 'json'
require 'github/markup'

class Markview < Sinatra::Base
  dir = File.dirname(File.expand_path(__FILE__))

  set :views,  "#{dir}/markview/views"
  set :public, "#{dir}/markview/public"
  set :static, true

  configure do
    @@markup = ARGV[0] ||= Dir.glob("README*")[0]
    if !@@markup.nil?
      File.new(@@markup, "w+")
    else
      raise LoadError, "Failed to find suitable file in current working directory!"; exit!
    end
  end

  # Renders the html using GitHub::Markup
  def self.render
    GitHub::Markup.render(@@markup, File.read(@@markup))
  end

  get '/' do
    @markdown = Markview.render
    @title = File.basename(@@markup)
    erb :base
  end

  get '/preview' do
    @markdown = Markview.render
    ({:error => false, :data => @markdown}).to_json
  end

  get '/edit' do
    @markdown = File.read(@@markup)
    ({:error => false, :data => "<textarea id='editbox'>#{@markdown}</textarea>"}).to_json
  end

  post '/save' do
    return ({:error => true, :message => "Failed to save file!"}).to_json unless request['markup']
    File.open(@@markup, 'w') { |f| f.write(request['markup']) }
    ({:error => false, :message => "File succesfully saved!"}).to_json
  end

end