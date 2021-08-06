# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Limpiando base de datos...'
Restaurant.destroy_all
puts 'La base de datos ha sido limpiada'

puts 'Creating records for database, hold on...'
100.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: %w(chinese italian japanese french belgian).sample
    # category: CATEGORIES.sample # global variable perhaps?
  )
  puts "Restaurant #{restaurant.id} is created"
end
 
puts 'Hecho'

