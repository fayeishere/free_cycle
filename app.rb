require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/json'

get '/' do
  erb :index
end


get '/note/:id/?' do
  content_type :json
  json subject: 'test', content: 'test'
end

delete '/note/:id/?' do
  head :ok
end