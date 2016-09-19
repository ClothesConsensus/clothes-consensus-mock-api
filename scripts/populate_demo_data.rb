
require './models/user'
require './models/look'
require './models/vote'
require './constants'


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
  offset = 2500  # half the looks will be live and half will be expired
  rand_int = rand(5000)

  time_left = rand_int - offset
  
  expiration_date = (DateTime.now.to_time - time_left.minutes).to_datetime
  expiration_date
end



Look.destroy_all

Look.create(user_id: aaron.id, quote: COLORS_QUOTE, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/2.jpg", type_index: 0)
Look.create(user_id: aaron.id, quote: PATTERN, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/3.jpg", type_index: 0)
Look.create(user_id: aaron.id, quote: HAWAII, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/5.jpg", type_index: 0)
Look.create(user_id: aaron.id, quote: COLORS_QUOTE, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/6.jpg", type_index: 0)
Look.create(user_id: aaron.id, quote: COOL, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/7.jpg", type_index: 0)
Look.create(user_id: aaron.id, quote: COLORS_QUOTE, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/8.jpg", type_index: 0)
Look.create(user_id: katie.id, quote: COLORS_QUOTE, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/9.jpg", type_index: 0)
Look.create(user_id: katie.id, quote: FIT, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/10.jpg", type_index: 0)
Look.create(user_id: katie.id, quote: FIT, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/11.jpg", type_index: 0)
Look.create(user_id: ryan.id, quote: PATTERN, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/13.jpg", type_index: 0)
Look.create(user_id: ryan.id, quote: HOW_COLORS, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/14.jpg", type_index: 0)
Look.create(user_id: jack.id, quote: SCHOOL_SPIRIT, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/15.jpg", type_index: 0)
Look.create(user_id: ryan.id, quote: FIT, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/16.jpg", type_index: 0)
Look.create(user_id: ryan.id, quote: COLORS_QUOTE, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/17.jpg", type_index: 0)
Look.create(user_id: ryan.id, quote: COLORS_QUOTE, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/18.jpg", type_index: 0)
Look.create(user_id: aaron.id, quote: COOL, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/4.jpg", type_index: 0)
Look.create(user_id: ryan.id, quote: FIT, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/19.jpg", type_index: 0)
Look.create(user_id: joe.id, quote: STYLE, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/20.jpg", type_index: 0)
Look.create(user_id: ryan.id, quote: COOL, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/21.jpg", type_index: 0)
Look.create(user_id: jack.id, quote: STYLE, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/22.jpg", type_index: 0)
Look.create(user_id: jack.id, quote: SCHOOL_SPIRIT, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/23.jpg", type_index: 0)
Look.create(user_id: jack.id, quote: FIT, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/24.jpg", type_index: 0)
Look.create(user_id: jack.id, quote: COLORS_QUOTE, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/25.jpg", type_index: 0)
Look.create(user_id: jack.id, quote: STYLE, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/26.jpg", type_index: 0)
Look.create(user_id: michael.id, quote: STYLE, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/27.jpg", type_index: 0)
Look.create(user_id: jack.id, quote: FIT, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/28.jpg", type_index: 0)
Look.create(user_id: jack.id, quote: STYLE, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/29.jpg", type_index: 0)
Look.create(user_id: jack.id, quote: STYLE, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/30.jpg", type_index: 0)
Look.create(user_id: katie.id, quote: PATTERN, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/36.jpg", type_index: 0)
Look.create(user_id: amanda.id, quote: SHOES, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/38.jpg", type_index: 0)
Look.create(user_id: michael.id, quote: HOW_COLORS, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/47.jpg", type_index: 0)
Look.create(user_id: michael.id, quote: COOL, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/50.jpg", type_index: 0)
Look.create(user_id: justin.id, quote: HOW_COLORS, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/51.jpg", type_index: 0)
Look.create(user_id: justin.id, quote: FIT, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/52.jpg", type_index: 0)
Look.create(user_id: aaron.id, quote: FIT, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/71.jpg", type_index: 0)
Look.create(user_id: aaron.id, quote: HALLOWEEN, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/72.jpg", type_index: 0)
Look.create(user_id: aaron.id, quote: COOL, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/74.jpg", type_index: 0)
Look.create(user_id: ryan.id, quote: STYLE, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/75.jpg", type_index: 0)
Look.create(user_id: michael.id, quote: STYLE, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/77.jpg", type_index: 0)
Look.create(user_id: amanda.id, quote: PATTERN, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/78.jpg", type_index: 0)
Look.create(user_id: pearl.id, quote: STYLE, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/79.jpg", type_index: 0)
Look.create(user_id: michael.id, quote: FIT, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/80.jpg", type_index: 0)
Look.create(user_id: jack.id, quote: PATTERN, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/81.jpg", type_index: 0)
Look.create(user_id: michael.id, quote: FIT, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/82.jpg", type_index: 0)
Look.create(user_id: ryan.id, quote: STYLE, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/83.jpg", type_index: 0)
Look.create(user_id: amanda.id, quote: HOW_COLORS, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/84.jpg", type_index: 0)
Look.create(user_id: amanda.id, quote: COOL, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/85.jpg", type_index: 0)
Look.create(user_id: pearl.id, quote: COOL, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/86.jpg", type_index: 0)
Look.create(user_id: jack.id, quote: FIT, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/88.jpg", type_index: 0)
Look.create(user_id: michael.id, quote: STYLE, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/89.jpg", type_index: 0)
Look.create(user_id: jack.id, quote: FIT, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/90.jpg", type_index: 0)
Look.create(user_id: joe.id, quote: FIT, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/91.jpg", type_index: 0)
Look.create(user_id: joe.id, quote: LOOK, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/92.jpg", type_index: 0)
Look.create(user_id: jack.id, quote: STYLE, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/93.jpg", type_index: 0)
Look.create(user_id: pearl.id, quote: STYLE, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/94.jpg", type_index: 0)
Look.create(user_id: joe.id, quote: FIT, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/95.jpg", type_index: 0)
Look.create(user_id: joe.id, quote: COLORS_QUOTE, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/96.jpg", type_index: 0)
Look.create(user_id: justin.id, quote: LOOK, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/97.jpg", type_index: 0)
Look.create(user_id: michael.id, quote: LOOK, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/98.jpg", type_index: 0)
Look.create(user_id: aaron.id, quote: COLORS_QUOTE, expiration: generate_random_expiration_time(), image_url: "/#{LOOK_IMAGE_PATH}/99.jpg", type_index: 0)


# Generate votes

Vote.destroy_all

Look.all.each do |look|
  25.times do
    user = User.where.not(id: look.user_id).shuffle.first
    value = rand(10) < 5
    look.votes.create(user_id: user.id, value: value)
  end
end
