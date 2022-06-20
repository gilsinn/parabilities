require 'faker'
require "open-uri"

puts 'Cleaning database...'
User.destroy_all
Category.destroy_all
OpeningHour.destroy_all
Facility.destroy_all
Cuisine.destroy_all
FacilityCuisine.destroy_all
RatingType.destroy_all
RatingTypeCategory.destroy_all
Review.destroy_all
ReviewRating.destroy_all
Channel.destroy_all
Message.destroy_all
Comment.destroy_all
puts 'Database Clean!'

# ---------------------
# users seeds
# ---------------------
puts 'Creating 11 fix and 6 random users...'


file = URI.open('https://source.unsplash.com/yMSecCHsIBc')
ann = User.new(
  firstname: "Ann",
  lastname: "Baker",
  username: "ann",
  email: "ann@abc.com",
  password: "123456"
)
ann.photo.attach(io: file, filename: 'ann.png', content_type: 'image/png')
ann.save!

file = URI.open('https://source.unsplash.com/E2Yd6K2A3fE')
joe = User.new(
  firstname: "Joe",
  lastname: "Smith",
  username: "joe",
  email: "joe@abc.com",
  password: "123456"
)
joe.photo.attach(io: file, filename: 'joe.png', content_type: 'image/png')
joe.save!

file = URI.open('https://source.unsplash.com/eU8cJsITNcQ')
angela = User.new(
  firstname: "Angela",
  lastname: "Baby",
  username: "Angela.B",
  email: "angel@abc.com",
  password: "123456"
)
angela.photo.attach(io: file, filename: 'angela.png', content_type: 'image/png')
angela.save!

file = URI.open('https://source.unsplash.com/FMh5o5m5N9E')
boomz = User.new(
  firstname: "Boomz",
  lastname: "Burger",
  username: "Boomz",
  email: "boomz@abc.com",
  password: "123456"
)
boomz.photo.attach(io: file, filename: 'boomz.png', content_type: 'image/png')
boomz.save!

file = URI.open('https://source.unsplash.com/random/?person')
gino = User.create!(
  firstname: "Gino",
  lastname: "Green",
  username: "Gino Green",
  email: "Gino@abc.com",
  password: "123456"
)

gino.photo.attach(io: file, filename: 'gino.png', content_type: 'image/png')
gino.save!

file = URI.open('https://source.unsplash.com/random/?person')
apolania = User.create!(
  firstname: "Apolnia",
  lastname: "Nia",
  username: "Apolania",
  email: "Apolania@abc.com",
  password: "123456"
)

apolania.photo.attach(io: file, filename: 'apolania.png', content_type: 'image/png')
apolania.save!

file = URI.open('https://source.unsplash.com/random/?person')
daniell = User.create!(
  firstname: "daniell",
  lastname: "libeskind",
  username: "Daniell",
  email: "Daniell@abc.com",
  password: "123456"
)

daniell.photo.attach(io: file, filename: 'daniell.png', content_type: 'image/png')
daniell.save!

file = URI.open('https://source.unsplash.com/random/?person')
michelina = User.create!(
  firstname: "Michelina",
  lastname: "Lee",
  username: "Michelina",
  email: "Michelina@abc.com",
  password: "123456"
)

michelina.photo.attach(io: file, filename: 'Michelina.png', content_type: 'image/png')
michelina.save!

file = URI.open('https://source.unsplash.com/random/?person')
antoine = User.create!(
  firstname: "Antoine",
  lastname: "Toni",
  username: "Antoine",
  email: "Antoine@abc.com",
  password: "123456"
)

antoine.photo.attach(io: file, filename: 'Antoine.png', content_type: 'image/png')
antoine.save!

file = URI.open('https://source.unsplash.com/random/?person')
sammy = User.create!(
  firstname: "Sammy",
  lastname: "Sun",
  username: "Sammy",
  email: "Sammy@abc.com",
  password: "123456"
)

sammy.photo.attach(io: file, filename: 'sammy.png', content_type: 'image/png')
sammy.save!

file = URI.open('https://source.unsplash.com/random/?person')
hobert = User.create!(
  firstname: "Hobert",
  lastname: "Neville",
  username: "Hobert",
  email: "Hobert@abc.com",
  password: "123456"
)
hobert.photo.attach(io: file, filename: 'Antoine.png', content_type: 'image/png')
hobert.save!

6.times do
  file = URI.open('https://source.unsplash.com/random/?person')
  user = User.new(
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    username: Faker::Internet.username(specifier: 5..10),
    email: Faker::Internet.email,
    password: "888888"
  )
  user.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
  user.save!
end


# ---------------------
# Categories seeds
# ---------------------
puts 'Creating categories...'

# file = URI.open(asset_path 'images/a0fxd7saxlav374ibgpfrt7ip416.jpg')

cat_restaurant = Category.create!(name: "Restaurants")
# cat_restaurant.photo.attach(io: File.open("app/assets/images/restaurant.jpeg"), filename: 'restaurant.jpeg', content_type: 'image/jpg')

cat_gym = Category.create!(name: "Gyms")
# cat_gym.photo.attach(io: File.open("app/assets/images/gym.jpeg"), filename: 'gym.jpeg', content_type: 'image/jpg')

cat_park = Category.create!(name: "Parks")
# cat_park.photo.attach(io: File.open("app/assets/images/park.jpeg"), filename: 'park.jpeg', content_type: 'image/jpg')

cat_restroom = Category.create!(name: "Restrooms")
# cat_restroom.photo.attach(io: File.open("app/assets/images/restroom.jpeg"), filename: 'restroom.jpeg', content_type: 'image/jpg')

# ---------------------
# opening hours seeds
# ---------------------
puts 'Creating opening hours...'

days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thurs', 'Fri', 'Sat']
hours = ['10am-10pm', '12pm-11pm']

# 5.times do
#   OpeningHour.create!(
#     day: "Closed on #{days.sample}",
#     hours: hours.sample
#   )
# end

# ---------------------
# Facilities seeds
# ---------------------

puts 'Creating 3 fix restaurants with 2 reviews each....'

# ------------- Restaurant 1 ------------


file = URI.open('https://source.unsplash.com/l0aeuaECCNA')
restaurant = Facility.new(
  name: "Amazing Seafood",
  address: "20 Collyer Quay",
  distance: 800,
  phone: Faker::PhoneNumber.phone_number_with_country_code,
  price_range: '$$$',
  category_id: cat_restaurant.id,
  # opening_hour_id: opening_hours.sample.id,
  verified_status: true,
  verified_date: Time.now
 )
restaurant.photo.attach(io: file, filename: 'seafood.png', content_type: 'image/png')
restaurant.save!

days.each do |day|
  openinghour = OpeningHour.new(
    day: day,
    hours: hours.sample
  )
  openinghour.facility = restaurant1
  openinghour.save!
end

review2 = Review.new(
  datetime: Faker::Time.backward(days: 180, format: :short),
  content: 'Excellent chili crab and very friendly staff service',
  user_id: 6,
  facility_id: restaurant.id
)
review2.save!

review3 = Review.new(
  datetime: Faker::Time.backward(days: 180, format: :short),
  content: 'very good but stop trying the constant upselling!',
  user_id: 7,
  facility_id: restaurant.id
)
review3.save!

# ------ Restaurant 2 -----------

file = URI.open('https://source.unsplash.com/sc5sTPMrVfk')
restaurant = Facility.new(
  name: "Boomz Burger",
  address: "111 Somerset Road",
  distance: 550,
  phone: Faker::PhoneNumber.phone_number_with_country_code,
  price_range: '$$',
  category_id: cat_restaurant.id,
  # opening_hour_id: opening_hours.sample.id,
  verified_status: true,
  verified_date: Time.now
)
restaurant.photo.attach(io: file, filename: 'burger.png', content_type: 'image/png')
restaurant.save!

days.each do |day|
  openinghour = OpeningHour.new(
    day: day,
    hours: hours.sample
  )
  openinghour.facility = restaurant2
  openinghour.save!
end

review21 = Review.new(
  datetime: Faker::Time.backward(days: 180, format: :short),
  content: 'Grilled to medium-rare, the beef was juicy, though it could do with just a touch more salt',
  user_id: 8,
  facility_id: restaurant.id
)
review21.save!

review22 = Review.new(
  datetime: Faker::Time.backward(days: 180, format: :short),
  content: 'Portions are huge, patties are juicy and big on flavour',
  user_id: 9,
  facility_id: restaurant.id
)
review22.save!

# ------ Restaurant 3 -----------

file = URI.open('https://source.unsplash.com/Wpg3Qm0zaGk')
restaurant = Facility.new(
  name: "Meow Meow Creamery",
  address: "5 Changi Village Road",
  distance: 8800,
  phone: Faker::PhoneNumber.phone_number_with_country_code,
  price_range: '$$$',
  category_id: cat_restaurant.id,
  # opening_hour_id: opening_hours.sample.id,
  verified_status: true,
  verified_date: Time.now
)
restaurant.photo.attach(io: file, filename: 'creamery.png', content_type: 'image/png')
restaurant.save!

days.each do |day|
  openinghour = OpeningHour.new(
    day: day,
    hours: hours.sample
  )
  openinghour.facility = restaurant
  openinghour.save!
end

review = Review.new(
  datetime: Faker::Time.backward(days: 180, format: :short),
  content: 'Small but comfortable place for ice cream! Personally loves cookies fudge so I enjoyed in very much',
  user_id: 10,
  facility_id: restaurant.id
)
review.save!

review = Review.new(
  datetime: Faker::Time.backward(days: 180, format: :short),
  content: 'Best cookie ice cream combo ever! But be prepared to wait; cookies go into the oven on order.',
  user_id: 6,
  facility_id: restaurant.id
)
review.save!

puts 'Creating 10 random restaurants with 1 review each...'

10.times do
  file = URI.open('https://source.unsplash.com/N_Y88TWmGwA')
  restaurant = Facility.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    distance: rand(1..1000),
    phone: Faker::PhoneNumber.phone_number_with_country_code,
    price_range: ['$', '$$', '$$$', '$$$$'].sample,
    category_id: cat_restaurant.id,
    # opening_hour_id: opening_hours.sample.id,
    verified_status: [true, false].sample,
    verified_date: Faker::Date.backward(days: 1000)
   )
   restaurant.photo.attach(io: file, filename: 'food.png', content_type: 'image/png')
   restaurant.save!

  days.each do |day|
    openinghour = OpeningHour.new(
      day: day,
      hours: hours.sample
    )
    openinghour.facility = restaurantz
    openinghour.save!
  end

  users = User.all
  review = Review.new(
    datetime: Faker::Time.backward(days: 180, format: :short),
    content: Faker::Restaurant.review,
    user_id: users.sample.id,
    facility_id: restaurantz.id
  )
  review.facility = restaurantz
  review.save!
end

puts 'Creating 2 fix gyms with 1 review each....'

# ----- Gym 1 --------

file = URI.open('https://source.unsplash.com/TY_Ce5d2G-k')
gym = Facility.new(
  name: "Apollo Gym",
  address: "252 North Bridge Rd",
  distance: 2750,
  phone: Faker::PhoneNumber.phone_number_with_country_code,
  price_range: '$$$',
  category_id: cat_gym.id,
  # opening_hour_id: opening_hours.sample.id,
  verified_status: true,
  verified_date: Time.now
 )
  gym.photo.attach(io: file, filename: 'guygym.png', content_type: 'image/png')
  gym.save!

 days.each do |day|
  openinghour = OpeningHour.new(
    day: day,
    hours: hours.sample
  )
  openinghour.facility = gym1
  openinghour.save!
end

reviewg1 = Review.new(
  datetime: Faker::Time.backward(days: 180, format: :short),
  content: ' Love this newly-launched fitness playground. Freelance personal trainers paid by the hour
  with no commission to the gym',
  user_id: 8,
  facility_id: gym.id
)
reviewg1.save!

# ------ Gym 2 --------

file = URI.open('https://source.unsplash.com/optBC2FxCfc')
gym = Facility.new(
  name: "Titans Gym",
  address: "100 Tras Street",
  distance: 2750,
  phone: Faker::PhoneNumber.phone_number_with_country_code,
  price_range: '$$$',
  category_id: cat_gym.id,
  # opening_hour_id: opening_hours.sample.id,
  verified_status: true,
  verified_date: Time.now
  )
  gym.photo.attach(io: file, filename: 'galgym.png', content_type: 'image/png')
  gym.save!

days.each do |day|
  openinghour = OpeningHour.new(
    day: day,
    hours: hours.sample
  )
  openinghour.facility = gym2
  openinghour.save!
end

reviewg2 = Review.new(
  datetime: Faker::Time.backward(days: 180, format: :short),
  content: "An inclusive community that welcomes all body types and goals.
  It’s easy to fall in love with fitness here!",
  user_id: 5,
  facility_id: gym.id
)
reviewg2.save!


puts 'Creating 10 random gyms with 1 review each...'

10.times do
  file = URI.open('https://source.unsplash.com/yDGsn39fbD4')
  gym = Facility.new(
    name: "#{Faker::Games::Pokemon.move} Gym",
    address: Faker::Address.street_address,
    distance: rand(1..1000),
    phone: Faker::PhoneNumber.phone_number_with_country_code,
    price_range: ['$', '$$', '$$$', '$$$$'].sample,
    category_id: cat_gym.id,
    # opening_hour_id: opening_hours.sample.id,
    verified_status: [true, false].sample,
    verified_date: Faker::Date.backward(days: 1000)
    )
    gym.photo.attach(io: file, filename: 'gym.png', content_type: 'image/png')
    gym.save!

  days.each do |day|
    openinghour = OpeningHour.new(
      day: day,
      hours: hours.sample
    )
    openinghour.facility = gymz
    openinghour.save!
  end

  users = User.all
  reviewu = Review.new(
    datetime: Faker::Time.backward(days: 180, format: :short),
    content: Faker::TvShows::GameOfThrones.quote,
    user_id: users.sample.id,
    facility_id: gymz.id
  )
  reviewu.save!
end


puts 'Creating 10 random parks with 1 review each...'

10.times do
  file = URI.open('https://source.unsplash.com/n9gMACRzkDw')
  park = Facility.new(
    name: "#{Faker::Fantasy::Tolkien.location} Park",
    address: Faker::Address.street_address,
    distance: rand(1..1000),
    # phone: Faker::PhoneNumber.phone_number_with_country_code,
    # price_range: ['$', '$$', '$$$', '$$$$'].sample,
    category_id: cat_park.id,
    # opening_hour_id: opening_hours.sample.id,
    verified_status: true,
    verified_date: Faker::Date.backward(days: 1000)
   )
  park.photo.attach(io: file, filename: 'park.png', content_type: 'image/png')
  park.save!

  openinghour = OpeningHour.new(
    day: 'Mon - Sun',
    hours: '24hrs'
    )
  openinghour.facility = park
  openinghour.save!

  users = User.all
  review = Review.new(
    datetime: Faker::Time.backward(days: 180, format: :short),
    content: Faker::Quotes::Shakespeare.as_you_like_it_quote,
    user_id: users.sample.id,
    facility_id: park.id
  )
  review.save!

end


puts 'Creating 10 random restrooms without review...'

10.times do
  file = URI.open('https://source.unsplash.com/-HUAUN0jDgQ')
  restroom = Facility.new(
    name: "#{Faker::Movies::HarryPotter.location} Restroom",
    address: Faker::Address.street_address,
    distance: rand(1..1000),
    # phone: Faker::PhoneNumber.phone_number_with_country_code,
    # price_range: ['$', '$$', '$$$', '$$$$'].sample,
    category_id: cat_restroom.id,
    # opening_hour_id: opening_hours.sample.id,
    verified_status: [true, false].sample,
    verified_date: Faker::Date.backward(days: 1000)
   )
  restroom.photo.attach(io: file, filename: 'restroom.png', content_type: 'image/png')
  restroom.save!

  days.each do |day|
    openinghour = OpeningHour.new(
      day: day,
      hours: hours.sample
    )
    openinghour.facility = restroom
    openinghour.save!
  end
end



# ---------------------
# Cuisines seeds
# ---------------------
puts 'Creating cuisines...'

cuisines = %w[French Italian Japanese Korean Chinese Indian Malay]
cuisines.each do |cuisine|
  Cuisine.create!(name: cuisine)
end

# ---------------------
# facilities_cuisines seeds
# ---------------------
puts 'Creating restaurants cuisines...'

restaurants = Facility.where(category_id: 1)
cuisines = Cuisine.all

restaurants.each do |restaurant|
  cuisine = cuisines.sample
  FacilityCuisine.create!(
    facility_id: restaurant.id,
    cuisine_id: cuisine.id
  )
end

# ---------------------
# rating types seeds
# ---------------------
puts 'Creating rating types...'

rating_types = %w[Wheelchair Staff Ambience Toilet]
rating_types.each do |rating_type|
  RatingType.create!(name: rating_type)
end

# ------------------------------
# rating_types categories seeds
# ------------------------------
puts 'Creating categories rating types...'

# categories = {1: "Restaurants", 2: "Gyms", 3: "Parks", 4: "Restrooms"}

restaurant_rating_type = [1, 2, 3, 4]
restaurant_rating_type.each do |rating_type|
  RatingTypeCategory.create!(
    category_id: 1,
    rating_type_id: rating_type
  )
end

gym_rating_type = [1, 2, 3, 4]
gym_rating_type.each do |rating_type|
  RatingTypeCategory.create!(
    category_id: 2,
    rating_type_id: rating_type
  )
end

park_rating_type = [1, 3, 4]
park_rating_type.each do |rating_type|
  RatingTypeCategory.create!(
    category_id: 3,
    rating_type_id: rating_type
  )
end

restroom_rating_type = [1, 4]
restroom_rating_type.each do |rating_type|
  RatingTypeCategory.create!(
    category_id: 4,
    rating_type_id: rating_type
  )
end

# ---------------------
# reviews seeds
# ---------------------
# puts 'Creating reviews...'

# users = User.all
# facilities = Facility.all

# 20.times do
#   Review.create!(
#     datetime: Faker::Time.backward(days: 180, format: :short),
#     content: Faker::TvShows::GameOfThrones.quote,
#     user_id: users.sample.id,
#     facility_id: facilities.sample.id
#   )
# end


# ---------------------
# review ratings seeds
# ---------------------
puts 'Creating review ratings...'

reviews = Review.all
rating_types = RatingType.all

reviews.each do |review|
  rating_types.each do |rating_type|
    ReviewRating.create!(
      rating: rand(1..5),
      review_id: review.id,
      rating_type_id: rating_type.id
    )
  end
end

# ---------------------
# channels seeds
# ---------------------
puts 'Creating channel...'

Channel.create!(name: "Community")

# ---------------------
# messages seeds
# ---------------------
puts 'Creating messages...'

users = User.all

20.times do
  Message.create!(
    content: Faker::Lorem.sentence,
    user_id: users.sample.id,
    channel_id: 1
  )
end

# ---------------------
# comments seeds
# ---------------------
puts 'Creating comments...'

users = User.all
reviews = Review.all

20.times do
  Comment.create!(
    comment: Faker::Lorem.sentence,
    user_id: users.sample.id,
    review_id: reviews.sample.id
  )
end

puts "Seeding completed!"
