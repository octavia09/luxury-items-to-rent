# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

puts "Destroying the items in db"
Item.destroy_all

10.times do

  p Item.create(
      name: Faker::Coffee.blend_name,
      description: Faker::Coffee.origin,
      size: ["XXS", "XS", "S", "M", "L", "XL", "XXL", "XXXL", "XXXXL"].sample,
      price: rand(10..10000),
      category: Item::CATEGORIES.sample,
      user: User.first
    )

end
