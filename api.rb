require 'base64'
require 'json'
require 'securerandom'
require 'sinatra'

require 'pry'

configure do
  set :bind, '0.0.0.0'
end

get '/' do
  'Hello world!'
end

get '/looks/' do
  content_type :json

  looks = []
  Dir.glob("./public/*.{jpg,png,gif}").each_with_index.map do |path, idx|
    looks << {
      id: idx,
      image_url: 'http://' + request.host_with_port + '/' + path.split('/').last
    }
  end.reverse

  looks.to_json
end

post '/looks/' do
  content_type :json

  image_string = params['imageString']
  file_location = './public/' + SecureRandom.hex + '.png' # just using random filenames for now, should be ids
  
  File.open(file_location, 'w') do |new_file|
    new_file.write Base64.decode64(image_string)
  end
  
  {message: 'The look was successfully created'}.to_json
end

get '/:filename' do |filename|
  content_type 'image/png'
end
