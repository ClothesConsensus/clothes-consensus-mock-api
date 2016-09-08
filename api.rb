require 'base64'
require 'json'
require 'securerandom'
require 'sinatra'
require './models/user'
require './config/environments'


require 'pry'

configure do
  set :bind, '0.0.0.0'
end

USER_THUMBNAIL_PATH = "user-thumbnails"

# configure :development do
#   set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'your_database_name', pool: 2, username: 'your_username', password: 'your_password'}
# end
#
# configure :production do
#   set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'your_database_name', pool: 2, username: 'your_username', password: 'your_password'}
# end


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

  puts params.keys
  puts params.values

  image_string = params['imageString']
  file_location = './public/' + SecureRandom.hex + '.png' # just using random filenames for now, should be ids
  
  File.open(file_location, 'w') do |new_file|
    new_file.write Base64.decode64(image_string)
  end
  
  {message: 'The look was successfully created'}.to_json
end

post '/looks/' do
  content_type :json

  image_string = params['image_string']
  filename = SecureRandom.hex + '.png' # just using random filenames for now, should be ids
  file_location = './public/looks/' + filename

  Look.create(image_url: "looks/#{filename}", user_id: params['user_id'], expiration: params['expiration'], type: 0, quote: params['quote'])
  
  File.open(file_location, 'w') do |new_file|
    new_file.write Base64.decode64(image_string)
  end
  
  {message: 'The look was successfully created'}.to_json
end



get '/:filename' do |filename|
  content_type 'image/png'
end

get '/#{USER_THUMBNAIL_PATH}/:filename' do |filename|
  content_type 'image/png'
end

get '/users/' do
  content_type :json
  @users = User.all.to_json
end

post '/users/' do
  content_type :json
  data = JSON.parse request.body.read
  user = User.create(name: data['name'], profile_image: "#{USER_THUMBNAIL_PATH}/" + data['profile_image'])
  user.to_json
end

get '/users/:id' do
  content_type :json
  User.find(params['id']).to_json
end

delete '/users/:id' do
  content_type :json
  User.delete(params['id'])
  {message: 'Success!'}.to_json
end

post '/vote/' do
  content_type :json
  data = JSON.parse request.body.read
  user = Vote.create(user_id: data['user_id'], look_id: data['look_id'], value: data['value'])
  {message: 'Success!'}.to_json
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