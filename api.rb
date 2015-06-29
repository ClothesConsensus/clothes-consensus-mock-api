require 'sinatra'
require 'json'


get '/' do
  'Hello world!'
end

get '/looks/' do
  content_type :json
  looks = [{
      id: 1,
      image_url: 'http://localhost:4567/look-example1.png',
    },
    {
      id: 2,
      image_url: 'http://localhost:4567/look-example2.png',
    }
  
  ].to_json
end

get '/:filename' do |filename|
  content_type 'image/png'
  img = Magick::Image.read('logo:')[0]
  img.format = 'png'
  img.to_blob
end