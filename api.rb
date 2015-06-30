
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

  looks = []
  Dir.glob("./public/*.png").each_with_index.map do |path, idx|
    looks << {
      id: idx,
      image_url: 'http://' + request.host + '/' + path.split('/').last
    }
  end

  looks.to_json
end

get '/:filename' do |filename|
  content_type 'image/png'
end