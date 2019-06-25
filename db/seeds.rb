# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "----------Clearing DB... 🧨 ----------"
print "==> #{ThirdParty.name.colorize(:blue)}"
ThirdParty.destroy_all
puts ' [CLEAR]'.colorize(:green)
print "==> #{User.name.colorize(:blue)}"
User.destroy_all
puts ' [CLEAR]'.colorize(:green)
puts "-------------------------------------"

puts
puts

puts '---------Create ThirdParty & User manufacturer 🛠 ---------'
puts "==> #{"Nouvel Er".colorize(:magenta)} "
print 'ThirdParty '.colorize(:blue) 
nouvelEr = ThirdParty.create(
    name: "Nouvel Er",
    address: "301 rue de lille",
    city: "Roncq",
    zip: "59223",
    country: "France",
    mail: "test@nouvel-er.com",
    web: "nouvel-er.com",
    tva: "FR50492544317",
    siret: "492544317",
    siren: "49254431700034",
    phone: "0320700969",
    third_party_type: 0
)
puts '[CREATE]'.colorize(:green)

print 'User '.colorize(:blue) 
User.create(
    email: "#{Faker::Internet.username}@nouvel-er.com",
    password: Faker::Internet.password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    third_party_id: nouvelEr
)
puts '[CREATE]'.colorize(:green)

puts "----------------------------------------------------"

puts
puts
