# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
require 'faker'
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p 'Destroying previous database!'
Flat.destroy_all

p 'Starting seed...'

10.times do
  flat = Flat.create!(
    name: Faker::Marketing.buzzwords,
    address: Faker::Address.full_address,
    description: Faker::Lorem.paragraph_by_chars,
    price_per_night: rand(50..200),
    number_of_guests: rand(1..4)
  )
  p "Flat with id: #{flat.id} created successfully"
end
p "Done!"