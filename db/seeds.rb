# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(email: "meelza43@gmail.com", first_name: "User", last_name: "Name", password: "password")
ImaginaryFriend.create(user: user1, name: 'Eugen', description: 'ugly', price: 1)
