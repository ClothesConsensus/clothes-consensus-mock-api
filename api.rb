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
      photo_url: 'http://' + request.host_with_port + '/' + path.split('/').last,
      message: get_random_message,
      user: get_random_user
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

get '/user-thumbnails/:filename' do |filename|
  content_type 'image/png'
end



get '/users/:id' do
  return {
    user_id: 1,    
  }
end


# TODO move this to tools
def get_random_message
  ["Does this fit?", "Do these colors work well on me", "Is this good for business casual?"].sample
end


def get_random_user
  users = [
    {
      id: 1,
      photo_thumbnail: 'http://' + request.host_with_port + "/user-thumbnails/" + "1" + ".jpg",
      name: "Ian"
    },
    {
      id: 2,
      photo_thumbnail: 'http://' + request.host_with_port + "/user-thumbnails/" + "2" + ".jpg",
      name: "Ryan"
    },
    {
      id: 3,
      photo_thumbnail: 'http://' + request.host_with_port + "/user-thumbnails/" + "3" + ".jpg",
      name: "Shashank"
    },
    {
      id: 4,
      photo_thumbnail: 'http://' + request.host_with_port + "/user-thumbnails/" + "4" + ".jpg",
      name: "Tomo"
    },
    {
      id: 5,
      photo_thumbnail: 'http://' + request.host_with_port + "/user-thumbnails/" + "5" + ".jpg",
      name: "Fat Nancy"
    }
  ].sample
end