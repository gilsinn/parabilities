require 'faker'

puts 'Cleaning database...'
Category.destroy_all
Facility.destroy_all
puts 'Database Clean!'


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
# Facilities seeds
# ---------------------

puts 'Creating ...restaurants'

20.times do
  Facility.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    distance: rand(1..1000),
    phone: Faker::PhoneNumber.phone_number_with_country_code,
    price_range: ['$', '$$', '$$$', '$$$$'].sample,
    category_id: cat_restaurant.id,
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
# opening hours seeds
# ---------------------

facilities = Facility.all
days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thurs', 'Fri', 'Sat']
hours = %w[24hrs 10am-10pm]

facilities.each do |facility|
  OpeningHour.create!(
    day: "Closed on #{days.sample}",
    hours: hours.sample,
    facility_id: facility.id,
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

puts "Seeding completed!"
