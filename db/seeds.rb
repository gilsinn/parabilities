
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

restaurants = Category.new(name: "Restaurants")
# restaurants.photo.attach(io: File.open("app/assets/images/restaurant.jpeg"), filename: 'restaurant.jpeg', content_type: 'image/jpg')
restaurants.save!

gyms = Category.new(name: "Gyms")
# gyms.photo.attach(io: File.open("app/assets/images/gyms.jpeg"), filename: 'gyms.jpeg', content_type: 'image/jpg')
gyms.save!

parks = Category.new(name: "Parks")
# parks.photo.attach(io: File.open("app/assets/images/parks.jpeg"), filename: 'parks.jpeg', content_type: 'image/jpg')
parks.save!

bathrooms = Category.new(name: "Bathrooms")
# bathrooms.photo.attach(io: File.open("app/assets/images/bathrooms.jpeg"), filename: 'bathrooms.jpeg', content_type: 'image/jpg')
bathrooms.save!


puts 'Creating facilities...'

20.times do
  Facility.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
  )
end

puts "Seeding completed!"
