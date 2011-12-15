require 'sinatra'

class Myapp < Sinatra::Base

  get '/' do
    "hello world"
  end
end
