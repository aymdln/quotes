# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# puts "----------Clearing DB... 🧨 ----------"
# print "==> #{ThirdParty.name.colorize(:magenta)}"
# ThirdParty.destroy_all
# puts ' [CLEAR]'.colorize(:green)
# print "==> #{User.name.colorize(:magenta)}"
# User.destroy_all
# puts ' [CLEAR]'.colorize(:green)
# puts "-------------------------------------"

Faker::Config.locale = "fr"

puts
puts

puts "---------Create ThirdParty & User manufacturer 🏭 ---------"
puts "==> #{"Nouvel Er".colorize(:magenta)} "
print "ThirdParty ".colorize(:blue)
nouvelEr = ThirdParty.create(
  name: "Nouvel Er",
  address: "301 rue de lille",
  city: "Roncq",
  zip: "59223",
  country: "France",
  email: "test@nouvel-er.com",
  web: "nouvel-er.com",
  tva: "FR50492544317",
  siret: "492544317",
  siren: "49254431700034",
  phone: "0320700969",
  third_party_type: 0,
)
puts "[CREATE]".colorize(:green)

print "User ".colorize(:blue)
User.create(
  email: "#{Faker::Internet.username}@nouvel-er.com",
  password: Faker::Internet.password,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  third_party_id: nouvelEr.id,
)
puts "[CREATE]".colorize(:green)

puts
puts

puts "----------Create ThirdParty, User & Relation for client 🛠-------------"

clients = Array.new
3.times do |n|
  name = "Client #{n += 1}"
  puts "==> #{name.colorize(:magenta)}"
  print "ThirdParty "
  email = Faker::Internet.email
  thirdParty = ThirdParty.create(
    name: name,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    zip: Faker::Address.zip,
    country: Faker::Address.country,
    email: email,
    web: Faker::Internet.domain_name,
    tva: "FR50492544317",
    siret: Faker::Company.french_siret_number,
    siren: Faker::Company.french_siren_number,
    phone: Faker::PhoneNumber.phone_number,
    third_party_type: 1,
  )
  puts "[CREATE]".colorize(:green)
  print "User "
  User.create(
    email: email,
    password: Faker::Internet.password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    third_party_id: thirdParty.id,
  )
  puts "[CREATE]".colorize(:green)
  print "Relation "
  relation = Relation.create(
    manufacturer_id: nouvelEr.id,
    client_id: thirdParty.id,
  )
  puts "[CREATE]".colorize(:green)
end

puts

puts "---------Create ThirdParty & User End client 👤----------"

9.times do |n|
  name = "End Client #{n += 1}"
  puts "==> #{name.colorize(:magenta)}"
  print "ThirdParty "
  email = Faker::Internet.email
  thirdParty = ThirdParty.create(
    name: name,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    zip: Faker::Address.zip,
    country: Faker::Address.country,
    email: email,
    web: Faker::Internet.domain_name,
    tva: "FR50492544317",
    siret: Faker::Company.french_siret_number,
    siren: Faker::Company.french_siren_number,
    phone: Faker::PhoneNumber.phone_number,
    third_party_type: 2,
  )
  puts "[CREATE]".colorize(:green)
  print "User "
  User.create(
    email: email,
    password: Faker::Internet.password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    third_party_id: thirdParty.id,
  )
  puts "[CREATE]".colorize(:green)
end

puts

puts "---------Create Products 📦 ----------"

name = "Skyner"
puts "==> #{name.colorize(:magenta)}"
print "Product"
product = Product.create(
  name: name,
  third_party_id: nouvelEr.id,
  category: 0,
  basic_coef: 2.2,
)
puts "[CREATE]".colorize(:green)

properties = [{
  name: "barre",
  ref: "K6103",
  description: "Porteur",
  value: 7000,
  product_id: product.id,
  price_cents: 65_45,
},
              {
  name: "Joint porteur",
  ref: "U612",
  description: "Joint porteur",
  value: 7000,
  product_id: product.id,
  price_cents: 33_79,
},
              {
  name: "Serreur",
  ref: "K6201",
  description: "Serreur",
  value: 6000,
  product_id: product.id,
  price_cents: 14_06,
},
              {
  name: "Joint serreur",
  ref: "U622",
  description: "Joint serreur",
  value: 250000,
  product_id: product.id,
  price_cents: 12_38,
},
              {
  name: "Capots",
  ref: "K6212",
  description: "Capots",
  value: 7000,
  product_id: product.id,
  price_cents: 15_63,
},
              {
  name: "Joint rupture mousse",
  ref: "H241",
  description: "Joint mousse",
  value: 6000,
  product_id: product.id,
  price_cents: 7_14,
},
              {
  name: "Profil obturation",
  ref: "T610",
  description: "Profil lat 1",
  value: 3500,
  product_id: product.id,
  price_cents: 6_70,
},
              {
  name: "Profil obturation",
  ref: "T612",
  description: "Profil lat 2",
  value: 3500,
  product_id: product.id,
  price_cents: 4_06,
},
              {
  name: "Tole a commande",
  ref: "",
  description: "Toles",
  value: 1000,
  product_id: product.id,
  price_cents: 14_00,
},
              {
  name: "Connecteurs",
  ref: "",
  description: "",
  value: 2,
  product_id: product.id,
  price_cents: 2_09,
},
              {
  name: "Vis",
  ref: "CBP1100",
  description: "",
  value: 100,
  product_id: product.id,
  price_cents: 25_00,
},
              {
  name: "Vitrage",
  ref: "",
  description: "",
  value: 0.000001,
  product_id: product.id,
  price_cents: 60_63,
},
              {
  name: "Compribande",
  ref: "",
  description: "",
  value: 1,
  product_id: product.id,
  price_cents: 22_50,
}]

properties.each do |item|
  print "-- #{item[:name].colorize(:blue)} "
  Propertie.create(
    name: item[:name],
    ref: item[:ref],
    description: item[:description],
    value: item[:value],
    product_id: item[:product_id],
    price_cents: item[:price_cents],
  )
  puts "[CREATE]".colorize(:green)
end

relations = Relation.all
relations.each do |relation|
  print "Relation Coef "
  RelationCoef.create(
    relation_id: relation.id,
    product_id: 1,
    coef: rand(1.0..2.0).round(2),
  )
  puts "[CREATE]".colorize(:green)
end

puts "-------Create Quotes 🧾---------"

final_client = ThirdParty.where(third_party_type: :final_client)
relations.each do |relation|
  5.times do
    quote = Quote.create(
      relation_id: relation.id,
      final_client_id: final_client.sample.id,
      references: Faker::Address.city,
      state: Quote.states.values.sample,
      price: rand(100000..1000000),
      state_date: Time.now,
    )
    QuoteProduct.create(
      product_id: 1,
      quote_id: quote.id
    )
  end
end

