# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# user1 = User.create(email: "meelza43@gmail.com", first_name: "User", last_name: "Name", password: "password")
# ImaginaryFriend.create(user: user1, name: 'Eugen', description: 'ugly', price: 1)

require 'faker'
require 'open-uri'
User.all.each { |user| user.photo.purge }

p 'clear database'
ImaginaryFriend.destroy_all
User.destroy_all
p 'cleard'
p '________________________________________________________________________________'

users = []

p 'create users'
user0 = User.create(email: "daniel@test.com", first_name: "User", last_name: "Name", password: "password")
file = URI.open(Faker::Avatar.image)
user0.photo.attach(io: file, filename: user0.first_name, content_type: "image/jpg")
users << user0
p "user0 created"

user1 = User.create(email: "kroner@test.com", first_name: "User", last_name: "Name", password: "password")
file = URI.open(Faker::Avatar.image)
user1.photo.attach(io: file, filename: user1.first_name, content_type: "image/jpg")
users << user1
p "user1 created"

user2 = User.create(email: "michael@test.com", first_name: "User", last_name: "Name", password: "password")
file = URI.open(Faker::Avatar.image)
user2.photo.attach(io: file, filename: user2.first_name, content_type: "image/jpg")
users << user2
p "user2 created"

user3 = User.create(email: "erman@test.com", first_name: "User", last_name: "Name", password: "password")
file = URI.open(Faker::Avatar.image)
user3.photo.attach(io: file, filename: user3.first_name, content_type: "image/jpg")
users << user3
p "user3 created"
p '________________________________________________________________________________'

p 'create imaginary friends'
4.times do |i|
  14.times do
    imaginary_friend = ImaginaryFriend.create(
      user: users[i],
      name: Faker::Fantasy::Tolkien.character,
      description: Faker::Quote.famous_last_words,
      price: rand(5000),
      special_abilities: Faker::Superhero.power,
      address: Faker::Address.full_address
    )
    file = URI.open(Faker::Avatar.image)
    imaginary_friend.photo.attach(io: file, filename: imaginary_friend.name, content_type: "image/jpg")
    p imaginary_friend
    p imaginary_friend.persisted? ? 'Created' : 'ERROR!!!'
  end
end
