# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"


Booking.destroy_all
Boat.destroy_all
User.destroy_all

user = User.new(email: 'ratata@gmail.com', password: '123456')
user.save!

count = 0

10.times do
puts "Creating a new boat"
links = ['https://res.cloudinary.com/vale-sapi/image/upload/v1622111484/barca10_tqg2pu.jpg', 'https://res.cloudinary.com/vale-sapi/image/upload/v1622111485/barca9_plxxsu.jpg', 'https://res.cloudinary.com/vale-sapi/image/upload/v1622111484/barca8_zwwykc.jpg', 'https://res.cloudinary.com/vale-sapi/image/upload/v1622111484/barca7_tlkya3.jpg', 'https://res.cloudinary.com/vale-sapi/image/upload/v1622111466/barca5_urv3bq.jpg', 'https://res.cloudinary.com/vale-sapi/image/upload/v1622111465/barca6_jmegac.jpg', 'https://res.cloudinary.com/vale-sapi/image/upload/v1622111465/barca4_xujewk.jpg', 'https://res.cloudinary.com/vale-sapi/image/upload/v1622111465/barca3_udzo6d.jpg', 'https://res.cloudinary.com/vale-sapi/image/upload/v1622111230/barca2_xtkudl.jpg', 'https://res.cloudinary.com/vale-sapi/image/upload/v1622111208/barca1_f5vqqj.jpg']
file = URI.open(links[count])
  boat = Boat.new(
    name: Faker::Name.name,
    location: "#{Faker::Address.city}",
    details: Faker::Quote.famous_last_words,
    price: rand(1000..10000),
    user_id: user.id
    )
  boat.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  boat.save!
  count += 1
end
