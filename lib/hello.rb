require 'sinatra/base'

class Hello < Sinatra::Base
  include ActionController::UrlWriter
  include Rails.application.routes.url_helpers
  include SinatraRails
  
  set :views => Rails.root.join('app', 'views')
  
  get '/' do
    @posts = Post.all
    erb 'main/index.html'.to_sym
  end
end