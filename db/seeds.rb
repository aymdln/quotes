Faker::Config.locale = "fr"

puts
puts

puts "---------Create ThirdParty & User manufacturer 🏭 ---------"
puts "==> #{"Nouvel Er".colorize(:magenta)} "
print "ThirdParty ".colorize(:blue)
nouvelEr = ThirdParty.create!(
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
User.create!(
  email: "test@nouvel-er.com",
  password: "azerty",
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
  thirdParty = ThirdParty.create!(
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
  User.create!(
    email: email,
    password: "azerty",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    third_party_id: thirdParty.id,
  )
  puts "[CREATE]".colorize(:green)
  print "Relation "
  relation = Relation.create!(
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
  thirdParty = ThirdParty.create!(
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
  User.create!(
    email: email,
    password: "azerty",
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
product = Product.create!(
  name: name,
  third_party_id: nouvelEr.id,
  category: 0,
  basic_coef: 2.2,
)
puts "[CREATE]".colorize(:green)

puts "Options"
options = [{
  name: "Dimension",
  product_id: product.id,
  option_type: 0,
  description: "Attention les dimensions sont en mm"
}]

3.times do |n|
  options << {
    name: "Color #{n + 1}",
    product_id: product.id,
    option_type: 1,
    description: ""
  } 
end

price_lists = [{
  dimension_1: 1000,
  dimension_2: 1000,
  price: 401.69
},
{
  dimension_1: 1500,
  dimension_2: 1000,
  price: 474.01
},
{
  dimension_1: 2000,
  dimension_2: 1000,
  price: 550.50
},
{
  dimension_1: 2500,
  dimension_2: 1000,
  price: 627.00
},
{
  dimension_1: 3000,
  dimension_2: 1000,
  price: 699.31
},
{
  dimension_1: 3500,
  dimension_2: 1000,
  price: 797.00
},
{
  dimension_1: 4000,
  dimension_2: 1000,
  price: 869.32
},
{
  dimension_1: 4500,
  dimension_2: 1000,
  price: 1060.69
},
{
  dimension_1: 5000,
  dimension_2: 1000,
  price: 1137.18
},
{
  dimension_1: 1000,
  dimension_2: 1500,
  price: 446.01
},
{
  dimension_1: 1500,
  dimension_2: 1500,
  price: 533.48
},
{
  dimension_1: 2000,
  dimension_2: 1500,
  price: 646.33
},
{
  dimension_1: 2500,
  dimension_2: 1500,
  price: 852.85
},
{
  dimension_1: 3000,
  dimension_2: 1500,
  price: 940.33
},
{
  dimension_1: 3500,
  dimension_2: 1500,
  price: 1031.98
},
{
  dimension_1: 4000,
  dimension_2: 1500,
  price: 1119.45
},
{
  dimension_1: 4500,
  dimension_2: 1500,
  price: 1211.10
},
{
  dimension_1: 5000,
  dimension_2: 1500,
  price: 1336.33
},
{
  dimension_1: 1000,
  dimension_2: 2000,
  price: 511.52
},
{
  dimension_1: 1500,
  dimension_2: 2000,
  price: 614.15
},
{
  dimension_1: 2000,
  dimension_2: 2000,
  price: 835.83
},
{
  dimension_1: 2500,
  dimension_2: 2000,
  price: 942.64
},
{
  dimension_1: 3000,
  dimension_2: 2000,
  price: 1045.27
},
{
  dimension_1: 3500,
  dimension_2: 2000,
  price: 1173.28
},
{
  dimension_1: 4000,
  dimension_2: 2000,
  price: 1275.91
},
{
  dimension_1: 4500,
  dimension_2: 2000,
  price: 1509.97
},
{
  dimension_1: 5000,
  dimension_2: 2000,
  price: 1616.78
},
{
  dimension_1: 1000,
  dimension_2: 2500,
  price: 670.71
},
{
  dimension_1: 1500,
  dimension_2: 2500,
  price: 788.49
},
{
  dimension_1: 2000,
  dimension_2: 2500,
  price: 910.46
},
{
  dimension_1: 2500,
  dimension_2: 2500,
  price: 1066.00
},
{
  dimension_1: 3000,
  dimension_2: 2500,
  price: 1183.79
},
{
  dimension_1: 3500,
  dimension_2: 2500,
  price: 1420.63
},
{
  dimension_1: 4000,
  dimension_2: 2500,
  price: 1538.42
},
{
  dimension_1: 4500,
  dimension_2: 2500,
  price: 1660.38
},
{
  dimension_1: 5000,
  dimension_2: 2500,
  price: 1828.55
}]

colors = [{
  
}]

options.each do |option|
  print ">> #{option[:name]} "
  option = Option.create(
    product_id: option[:product_id],
    option_type: option[:option_type],
    description: option[:description]
  )
  if option.option_type == "dimension"
    DimensionName.create(
      dimension_1_name: "largeur",
      dimension_2_name: "rampant",
      option_id: option.id
    )
    price_lists.each do |price_list|
      PriceList.create(
        option_id: option.id,
        dimension_1: price_list[:dimension_1],
        dimension_2: price_list[:dimension_2],
        price: price_list[:price]
      )
    end
  else
  end
  puts "[CREATE]".colorize(:green)
end 
relations = Relation.all
relations.each do |relation|
  print "Relation Coef "
  RelationCoef.create!(
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
    quote = Quote.create!(
      relation_id: relation.id,
      final_client_id: final_client.sample.id,
      references: Faker::Address.city,
      state: Quote.states.values.sample,
      price: rand(10000..100000),
      state_date: Time.now,
    )
    QuoteProduct.create!(
      product_id: 1,
      quote_id: quote.id
    )
  end
end

