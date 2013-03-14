require 'rack'
require 'rack/contrib'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/json'

get '/note/:id/?' do
  content_type :json
  json subject: 'test', content: 'test'
end

delete '/note/:id/?' do
  head :ok
end