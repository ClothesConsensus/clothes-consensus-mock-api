
require 'sinatra'
require 'json'

configure do
  set :bind, '0.0.0.0'
end

get '/' do
  'Hello world!'
end

get '/looks/' do
  content_type :json
  looks = [{
      id: 1,
      image_url: 'http://' + request.host + '/look-example1.png',
    },
    {
      id: 2,
      image_url: 'http://' + request.host + '/look-example2.png',
    }
  
  ].to_json
end

get '/:filename' do |filename|
  content_type 'image/png'
end