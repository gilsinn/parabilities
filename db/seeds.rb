require 'faker'

puts 'Cleaning database...'
Category.destroy_all
Facility.destroy_all
puts 'Database Clean!'


puts 'Creating categories...'

# file = URI.open(asset_path 'images/a0fxd7saxlav374ibgpfrt7ip416.jpg')

cat_restaurant = Category.create!(name: "Restaurants")
# restaurant.photo.attach(io: File.open("app/assets/images/restaurant.jpeg"), filename: 'restaurant.jpeg', content_type: 'image/jpg')

cat_gym = Category.create!(name: "Gyms")
# gym.photo.attach(io: File.open("app/assets/images/gym.jpeg"), filename: 'gym.jpeg', content_type: 'image/jpg')

cat_park = Category.create!(name: "Parks")
# park.photo.attach(io: File.open("app/assets/images/park.jpeg"), filename: 'park.jpeg', content_type: 'image/jpg')

cat_restroom = Category.create!(name: "Restrooms")
# restroom.photo.attach(io: File.open("app/assets/images/restroom.jpeg"), filename: 'restroom.jpeg', content_type: 'image/jpg')


puts 'Creating ...restaurants'

10.times do
  Facility.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone: Faker::PhoneNumber.phone_number,
    price_range: ['$', '$$', '$$$', '$$$$'].sample,
    category_id: cat_restaurant.id,
    verified_status: true,
    verified_date: Faker::Date.backward(days: 1000)
   )
end

puts 'Creating ...gyms'

10.times do
  Facility.create!(
    name: "#{Faker::Games::Pokemon.move} Gym",
    address: Faker::Address.street_address,
    phone: Faker::PhoneNumber.phone_number,
    price_range: ['$', '$$', '$$$', '$$$$'].sample,
    category_id: cat_gym.id,
    verified_status: true,
    verified_date: Faker::Date.backward(days: 1000)
   )
end

puts 'Creating ...parks'

10.times do
  Facility.create!(
    name: "#{Faker::Fantasy::Tolkien.location} Park",
    address: Faker::Address.street_address,
    phone: Faker::PhoneNumber.phone_number,
    price_range: ['$', '$$', '$$$', '$$$$'].sample,
    category_id: cat_park.id,
    verified_status: true,
    verified_date: Faker::Date.backward(days: 1000)
  )
end

puts 'Creating ...restrooms'
10.times do
  Facility.create!(
    name: "#{Faker::Movies::HarryPotter.location} Restroom",
    address: Faker::Address.street_address,
    phone: '',
    price_range: '',
    category_id: cat_restroom.id,
    verified_status: true,
    verified_date: Faker::Date.backward(days: 1000)
  )
end

puts "Seeding completed!"
