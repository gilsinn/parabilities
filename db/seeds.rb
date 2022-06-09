
puts 'Cleaning database...'
Category.destroy_all
Facility.destroy_all
puts 'Database Clean!'

# puts 'Creating users...'
# user1 = User.new(username: "batman",
#                 password: "123456",
#                 email: "john@123.com",
#                 first_name: "John",
#                 last_name: "Doe",
#                 address: "888 This Street")
# user1.save!

# user2 = User.new(username: "wonderer",
#                 password: "123456",
#                 email: "jane@123.com",
#                 first_name: "Jane",
#                 last_name: "Smith",
#                 address: "111 That Street")
# user2.save!
# users = User.all

puts 'Creating categories...'

# file = URI.open(asset_path 'images/a0fxd7saxlav374ibgpfrt7ip416.jpg')

category1 = Category.new(name: "Restaurant")
# restaurant.photo.attach(io: File.open("app/assets/images/restaurant.jpeg"), filename: 'restaurant.jpeg', content_type: 'image/jpg')
category1.save!

category2 = Category.new(name: "Gym")
# gym.photo.attach(io: File.open("app/assets/images/gym.jpeg"), filename: 'gym.jpeg', content_type: 'image/jpg')
category2.save!

category3 = Category.new(name: "Park")
# park.photo.attach(io: File.open("app/assets/images/park.jpeg"), filename: 'park.jpeg', content_type: 'image/jpg')
category3.save!

category4 = Category.new(name: "Restroom")
# restroom.photo.attach(io: File.open("app/assets/images/restroom.jpeg"), filename: 'restroom.jpeg', content_type: 'image/jpg')
category4.save!


puts 'Creating ...restaurants'

10.times do
  Facility.create!(
    name: Faker::Name.name,
    address: Faker::Internet.email,
    phone: Faker::,
    price_range: ['$', '$$', '$$$', '$$$$'].sample,
    category: "Restaurant",
    verified_status: true,
    verified_date: Faker::
   )
end

puts 'Creating ...gyms'

10.times do
  Facility.create!(
    name: Faker::Name.name,
    address: Faker::Internet.email,
    phone: Faker::,
    price_range: ['$', '$$', '$$$', '$$$$'].sample,
    category: "Gym",
    verified_status: true,
    verified_date: Faker::
   )

puts 'Creating ...parks'

  10.times do
  Facility.create!(
    name: Faker::Name.name,
    address: Faker::Internet.email,
    phone: Faker::,
    price_range: ['$', '$$', '$$$', '$$$$'].sample,
    category: "Park",
    verified_status: true,
    verified_date: Faker::
    )

puts 'Creating ...restrooms'
10.times do
  Facility.create!(
    name: Faker::Name.name,
    address: Faker::Internet.email,
    phone: Faker::,
    price_range: ['$', '$$', '$$$', '$$$$'].sample,
    category: "Restroom",
    verified_status: true,
    verified_date: Faker::
    )

puts "Seeding completed!"
