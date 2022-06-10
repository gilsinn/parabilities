require 'faker'

puts 'Cleaning database...'
Category.destroy_all
Facility.destroy_all
puts 'Database Clean!'

# ---------------------
# users seeds
# ---------------------

Ann = User.create!(
  # firstname: "Ann",
  # lastname: "Baker",
  # username: "ann",
  email: "ann@abc.com",
  password: "123456"
)

Joe = User.create!(
  # firstname: "Joe",
  # lastname: "Smith",
  # username: "joe",
  email: "joe@abc.com",
  password: "123456"
)

Bob = User.create!(
  # firstname: "Bob",
  # lastname: "Miller",
  # username: "bob",
  email: "bob@abc.com",
  password: "123456"
)

10.times do
  User.create!(
    # firstname: Faker::Name.first_name ,
    # lastname: Faker::Name.last_name,
    # username: "samesame",
    email: Faker::Internet.email,
    password: "888888"
  )
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

days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thurs', 'Fri', 'Sat']
hours = ['24hrs', '10am-10pm', '7am-2pm']

5.times do
  OpeningHour.create!(
    day: "Closed on #{days.sample}",
    hours: hours.sample
  )
end

# ---------------------
# Facilities seeds
# ---------------------

opening_hours = OpeningHour.all

puts 'Creating ...restaurants'

20.times do
  Facility.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    distance: rand(1..1000),
    phone: Faker::PhoneNumber.phone_number_with_country_code,
    price_range: ['$', '$$', '$$$', '$$$$'].sample,
    category_id: cat_restaurant.id,
    opening_hours_id: opening_hours.sample.id,
    verified_status: [true, false].sample,
    verified_date: Faker::Date.backward(days: 1000)
   )
end

puts 'Creating ...gyms'

20.times do
  Facility.create!(
    name: "#{Faker::Games::Pokemon.move} Gym",
    address: Faker::Address.street_address,
    distance: rand(1..1000),
    phone: Faker::PhoneNumber.phone_number,
    price_range: ['$', '$$', '$$$', '$$$$'].sample,
    category_id: cat_gym.id,
    opening_hours_id: opening_hours.sample.id,
    verified_status: [true, false].sample,
    verified_date: Faker::Date.backward(days: 1000)
   )
end

puts 'Creating ...parks'

20.times do
  Facility.create!(
    name: "#{Faker::Fantasy::Tolkien.location} Park",
    address: Faker::Address.street_address,
    distance: rand(1..1000),
    phone: Faker::PhoneNumber.phone_number,
    price_range: ['$', '$$', '$$$', '$$$$'].sample,
    category_id: cat_park.id,
    opening_hours_id: opening_hours.sample.id,
    verified_status: [true, false].sample,
    verified_date: Faker::Date.backward(days: 1000)
  )
end

puts 'Creating ...restrooms'
20.times do
  Facility.create!(
    name: "#{Faker::Movies::HarryPotter.location} Restroom",
    address: Faker::Address.street_address,
    distance: rand(1..1000),
    # phone: Faker::PhoneNumber.phone_number,
    # price_range: ['$', '$$', '$$$', '$$$$'].sample,
    category_id: cat_restroom.id,
    opening_hours_id: opening_hours.sample.id,
    verified_status: [true, false].sample,
    verified_date: Faker::Date.backward(days: 1000)
  )
end

# ---------------------
# Cuisines seeds
# ---------------------

puts 'Creating ...cuisines'

cuisines = %w[French Italian Japanese Korean Chinese Indian Malay]
cuisines.each do |cuisine|
  Cuisine.create!(name: cuisine)
end

# ---------------------
# facilities_cuisines seeds
# ---------------------

puts 'Creating ...restaurants cuisines'

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

puts 'Creating ...rating types'

rating_types = %w[Wheelchair Staff Ambience Bathroom]
rating_types.each do |rating_type|
  RatingType.create!(name: rating_type)
end

# ---------------------
# reviews seeds
# ---------------------

users = User.all
facilities = Facility.all

20.times do
  Review.create!(
    datetime: Faker::Time.backward(days: 180, format: :short),
    content: Faker::Restaurant.review,
    user_id: users.sample.id,
    facility_id: facilities.sample.id
  )
end

# ---------------------
# review ratings seeds
# ---------------------
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

Channel.create!(name: "Community")

# ---------------------
# messages seeds
# ---------------------

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
