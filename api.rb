require 'base64'
require 'json'
require 'securerandom'
require 'sinatra'
require './models/look'
require './models/user'
require './models/vote'
require './config/environments'
require './constants'


require 'pry'

configure do
  set :bind, '0.0.0.0'
end

get '/' do
  'Hello world!'
end

get '/looks/' do
  content_type :json
  Look.all.shuffle.to_json({include: :user, methods: :vote_results})  # scrambling this now so it's more interesting
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
  file_location = "./public/#{LOOK_IMAGE_PATH}/" + filename

  Look.create(image_url: "looks/#{filename}", user_id: params['user_id'], expiration: params['expiration'], type: 0, quote: params['quote'])
  
  File.open(file_location, 'w') do |new_file|
    new_file.write Base64.decode64(image_string)
  end
  
  {message: 'The look was successfully created'}.to_json
end

get "/:filename" do |filename|
  content_type "image/png"
end

get "/#{USER_THUMBNAIL_PATH}/:filename" do |filename|
  content_type "image/png"
end

get "/#{USER_BANNER_PATH}/:filename" do |filename|
  content_type "image/png"
end

get "/#{LOOK_IMAGE_PATH}/:filename" do |filename|
  content_type "image/png"
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

get '/users/:id/' do
  content_type :json
  user = User.find(params['id']).to_json({
    include: [{looks: {
      methods: :vote_results
    }}]
  })
end

delete '/users/:id/' do
  content_type :json
  User.delete(params['id'])
  {message: 'Success!'}.to_json
end

post '/looks/:look_id/votes/' do
  content_type :json
  data = JSON.parse request.body.read
  user = Vote.create(user_id: data['user_id'], look_id: params['look_id'], value: data['vote'])
  {message: 'The vote was successfully cast!'}.to_json
end

get '/looks/:look_id/votes/' do
  content_type :json
  Look.find(params[:look_id]).votes.to_json
end

get '/reset_db/' do
  require './scripts/populate_demo_data'
  {message: 'The db was successfully reset'}.to_json
end
