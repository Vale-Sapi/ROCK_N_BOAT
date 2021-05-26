# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
user = User.new(email: 'ratata@gmail.com', password: '123456')

10.times do
  boat = Boat.new(
    name:    Faker::Name.name,
    location: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    details: Faker::Quote.famous_last_words,
    price: rand(1000..10000),
    user: user
  )
  boat.save!
end
