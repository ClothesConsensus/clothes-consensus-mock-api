
require './models/user'
require './models/look'
require './models/vote'
require './constants'
require 'pry'


# Generate users
User.destroy_all

ian = User.create(name: "Ian", profile_image: "/#{USER_THUMBNAIL_PATH}/1.jpg", banner_image: "/#{USER_BANNER_PATH}/1.jpg")
ryan = User.create(name: "Ryan", profile_image: "/#{USER_THUMBNAIL_PATH}/2.jpg", banner_image: "/#{USER_BANNER_PATH}/2.jpg")
shashank = User.create(name: "Shashank", profile_image: "/#{USER_THUMBNAIL_PATH}/3.jpg", banner_image: "/#{USER_BANNER_PATH}/3.jpg")
tomo = User.create(name: "Tomo", profile_image: "/#{USER_THUMBNAIL_PATH}/4.jpg", banner_image: "/#{USER_BANNER_PATH}/4.jpg")
fat_nancy = User.create(name: "Fat Nancy", profile_image: "/#{USER_THUMBNAIL_PATH}/5.jpg", banner_image: "/#{USER_BANNER_PATH}/5.jpg")
katie = User.create(name: "Katie", profile_image: "/#{USER_THUMBNAIL_PATH}/6.jpg", banner_image: "/#{USER_BANNER_PATH}/6.jpg")
pearl = User.create(name: "Pearl", profile_image: "/#{USER_THUMBNAIL_PATH}/7.jpg", banner_image: "/#{USER_BANNER_PATH}/7.jpg")
aaron = User.create(name: "Aaron", profile_image: "/#{USER_THUMBNAIL_PATH}/8.jpg", banner_image: "/#{USER_BANNER_PATH}/8.jpg")
jack = User.create(name: "Jack", profile_image: "/#{USER_THUMBNAIL_PATH}/9.jpg", banner_image: "/#{USER_BANNER_PATH}/9.jpg")
amanda = User.create(name: "Amanda", profile_image: "/#{USER_THUMBNAIL_PATH}/10.jpg", banner_image: "/#{USER_BANNER_PATH}/10.jpg")
joe = User.create(name: "Joe", profile_image: "/#{USER_THUMBNAIL_PATH}/11.jpg", banner_image: "/#{USER_BANNER_PATH}/11.jpg")
justin = User.create(name: "Justin", profile_image: "/#{USER_THUMBNAIL_PATH}/12.jpg", banner_image: "/#{USER_BANNER_PATH}/12.jpg")
michael = User.create(name: "Michael", profile_image: "/#{USER_THUMBNAIL_PATH}/13.jpg", banner_image: "/#{USER_BANNER_PATH}/13.jpg")


# Generate Looks

COLORS_QUOTE = "Do these colors work on me?"
PATTERN = "Is this a good pattern?"
COOL = "Is this a cool shirt?"
HAWAII = "For a trip to Hawaii?"
FIT = "Does this fit well?"
HOW_COLORS = "How about these colors?"
SCHOOL_SPIRIT = "For some school spirit?"
STYLE = "Is this a cool style?"
SHOES = "Do you like these shoes?"
HALLOWEEN = "For Halloween?"
LOOK = "How does this look?"

expiration_time = DateTime.new(2017,1,1,1,1,1)



def generate_random_expiration_time()
  offset = 1000  # half the looks will be live and half will be expired
  rand_int = rand(2500)

  time_left = rand_int - offset
  
  expiration_date = (DateTime.now.to_time - time_left.minutes).to_datetime
  expiration_date
end

$inc_time = 5
def incremented_time
  time = (DateTime.now.to_time + $inc_time.minutes).to_datetime
  $inc_time += 5
  time
end


$dec_time = 5
def decremented_time
  time = (DateTime.now.to_time - $dec_time.minutes).to_datetime
  $dec_time += 5
  time
end



Look.destroy_all


Look.create([{user_id: jack.id, quote: "Does this work?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/38.jpg", type_index: 0},
{user_id: justin.id, quote: "For a casual day?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/10.jpg", type_index: 0},
{user_id: joe.id, quote: "Does this outfit work?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/17.jpg", type_index: 0},
{user_id: michael.id, quote: "How about these textures?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/25.jpg", type_index: 0},
{user_id: michael.id, quote: "Thoughts on this watch?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/32.jpg", type_index: 0},
{user_id: fat_nancy.id, quote: "How about this shirt?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/20.jpg", type_index: 0},
{user_id: aaron.id, quote: "What do you think of these shoes?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/3.jpg", type_index: 0},
{user_id: aaron.id, quote: "Is this a cool combo?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/4.jpg", type_index: 0},
{user_id: aaron.id, quote: "This tie with the suit?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/6.jpg", type_index: 0},
{user_id: joe.id, quote: "Too much denim?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/7.jpg", type_index: 0},
{user_id: aaron.id, quote: "How's the color on these shoes?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/2.jpg", type_index: 0},
{user_id: joe.id, quote: "Does this work?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/9.jpg", type_index: 0},
{user_id: michael.id, quote: "Pretty casual?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/11.jpg", type_index: 0},
{user_id: jack.id, quote: "Thoughts on this?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/12.jpg", type_index: 0},
{user_id: aaron.id, quote: "How does this color scheme look?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/1.jpg", type_index: 0},
{user_id: justin.id, quote: "Cuffed?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/14.jpg", type_index: 0},
{user_id: jack.id, quote: "Is this a cool shirt?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/15.jpg", type_index: 0},
{user_id: joe.id, quote: "The ripped jeans?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/18.jpg", type_index: 0},
{user_id: jack.id, quote: "Is this a cool style?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/21.jpg", type_index: 0},
{user_id: jack.id, quote: "How about the pattern on this shirt?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/22.jpg", type_index: 0},
{user_id: aaron.id, quote: "Thoughts on this combo?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/35.jpg", type_index: 0},
{user_id: jack.id, quote: "Do you like this jacket?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/24.jpg", type_index: 0},
{user_id: jack.id, quote: "How about these pants?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/27.jpg", type_index: 0},
{user_id: jack.id, quote: "Is this a cool shirt?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/28.jpg", type_index: 0},
{user_id: joe.id, quote: "How about this style?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/29.jpg", type_index: 0},
{user_id: justin.id, quote: "Does this look sharp?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/30.jpg", type_index: 0},
{user_id: michael.id, quote: "Casual look?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/31.jpg", type_index: 0},
{user_id: jack.id, quote: "Do these colors work together?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/23.jpg", type_index: 0},
{user_id: justin.id, quote: "For a trip to Hawaii?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/33.jpg", type_index: 0},
{user_id: aaron.id, quote: "Is this a cool style?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/36.jpg", type_index: 0},
{user_id: aaron.id, quote: "Does this look too preppy?", expiration: decremented_time, image_url: "/#{LOOK_IMAGE_PATH}/37.jpg", type_index: 0}])


# Looks for Ryan, the main demo users
Look.create([{user_id: ryan.id, quote: "Thoughts on this style?", expiration: incremented_time, image_url: "/#{LOOK_IMAGE_PATH}/19.jpg", type_index: 0},
{user_id: ryan.id, quote: "Is this a cool combo?", expiration: incremented_time, image_url: "/#{LOOK_IMAGE_PATH}/8.jpg", type_index: 0},
{user_id: ryan.id, quote: "Thoughts on this shirt?", expiration: incremented_time, image_url: "/#{LOOK_IMAGE_PATH}/16.jpg", type_index: 0},
{user_id: ryan.id, quote: "Is this a cool jacket?", expiration: incremented_time, image_url: "/#{LOOK_IMAGE_PATH}/34.jpg", type_index: 0},
{user_id: ryan.id, quote: "Thoughts on this style?", expiration: incremented_time, image_url: "/#{LOOK_IMAGE_PATH}/5.jpg", type_index: 0},
{user_id: ryan.id, quote: "Does this watch work with the shirt?", expiration: incremented_time, image_url: "/#{LOOK_IMAGE_PATH}/26.jpg", type_index: 0},
{user_id: ryan.id, quote: "Like the lack of color?", expiration: incremented_time, image_url: "/#{LOOK_IMAGE_PATH}/13.jpg", type_index: 0}])







# Generate votes

Vote.destroy_all

Look.all.each do |look|
  25.times do
    user = User.where.not(id: look.user_id).shuffle.first
    value = rand(10) < 5
    look.votes.create(user_id: user.id, value: value)
  end
end
