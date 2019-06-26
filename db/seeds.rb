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

puts "----------Create ThirdParty & User client 🛠-------------"

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
