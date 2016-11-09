# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


NB_RESTO = 20
NB_REV = 5
MAX_RATING = 5

Restaurant.destroy_all
NB_RESTO.times do |resto_id|

  resto_address = Faker::Address.street_address + ", " + Faker::Address.zip_code + " " + Faker::Address.city

  resto = Restaurant.create!( name: Faker::Company.name,
                                               address: resto_address,
                                               phone_number: Faker::PhoneNumber.phone_number,
                                               category: ["chinese", "japanese", "belgian", "italian", "french"].sample
                                                 )
  # byebug
  rand(0..NB_REV).times do |j|
    rev = resto.reviews.create!( content: Faker::Lorem.paragraph(1, true, 2),
                                        rating: rand(0..MAX_RATING),
                                        restaurant_id: rand(resto_id)
                                        )

    # Note: plutot que le .create!, on aurait pu faire un:
    # rev = resto.review.create!(...)
    # rev.save
  end
end

# Other example (Restaurant only)
#
# Restaurant.destroy_all
# restaurants_attributes = [
#   {
#     name:         "Epicure au Bristol",
#     address:      "112 rue du Fg St-Honoré 75008 Paris",
#     phone_number: "0156326598",
#     category:  "belgian"
#   },
#   {
#     name:         "La truffière",
#     address:      "4 rue Blainville 75005 Paris",
#     phone_number: "0156826352",
#     category:  "french"
#   },
#   {
#     name:         "Le pré catalan",
#     address:      "route de Suresnes 75016 Paris",
#     phone_number: "0148523698",
#     category:  "italian"
#   },
#   {
#     name:         "Pizza Papa",
#     address:      "avenue les pins blancs 31000 Toulouse",
#     phone_number: "0561481975",
#     category:  "italian"
#   },
#   {
#     name:         "Bar eau de chaise",
#     address:      "Forum 33400 Talence",
#     phone_number: "0556523698",
#     category:  "japanese"
#   }
# ]
# restaurants_attributes.each { |params| Restaurant.create!(params) }
