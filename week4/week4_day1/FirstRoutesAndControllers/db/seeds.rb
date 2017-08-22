# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

user1 = User.create(username: Faker::Name.name, email: Faker::Internet.email)
user2 = User.create(username: Faker::Name.name, email: Faker::Internet.email)
user3 = User.create(username: Faker::Name.name, email: Faker::Internet.email)
user4 = User.create(username: Faker::Name.name, email: Faker::Internet.email)
user5 = User.create(username: Faker::Name.name, email: Faker::Internet.email)
user6 = User.create(username: Faker::Name.name, email: Faker::Internet.email)
user7 = User.create(username: Faker::Name.name, email: Faker::Internet.email)
user8 = User.create(username: Faker::Name.name, email: Faker::Internet.email)
user9 = User.create(username: Faker::Name.name, email: Faker::Internet.email)
user10 = User.create(username: Faker::Name.name, email: Faker::Internet.email)
user11 = User.create(username: Faker::Name.name, email: Faker::Internet.email)
user12 = User.create(username: Faker::Name.name, email: Faker::Internet.email)
user13 = User.create(username: Faker::Name.name, email: Faker::Internet.email)
user14 = User.create(username: Faker::Name.name, email: Faker::Internet.email)
user15 = User.create(username: Faker::Name.name, email: Faker::Internet.email)
