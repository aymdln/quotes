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
  name: "dimensions",
  product_id: 1,
  option_type: 0,
  description: "Attention les dimensions sont en mm",
},
           {
  name: "Vitrage",
  product_id: 1,
  option_type: 2,
  description: "",
},
           {
  name: "Couleur",
  product_id: 1,
  option_type: 1,
  description: "",
},
           {
  name: "Section",
  product_id: 1,
  option_type: 3,
  description: "",
}]

option_colors = [{
  ral: "9016",
  price: 0,
  name: "blanc",
},
                 {
  ral: "9005",
  price: 0,
  name: "noir",
},
                 {
  ral: "7016",
  price: 0,
  name: "gris anthracite",
}]

options.each do |option|
  option = Option.create(
    product_id: option[:product_id],
    option_type: option[:option_type],
    description: option[:description],
  )
  if option[:option_type] == 0
    OptionDimension.create(
      name: "largeur",
      option: option,
      value: "",
    )
    OptionDimension.create(
      name: "rampant",
      option: option,
      value: "",
    )
  elsif option[:option_type] == 1
    option_colors.each do |color|
      OptionColor.create(
        name: color[:name],
        color_type: :ral,
        option: option,
        color_value: color[:ral],
        included: true,
      )
    end
  elsif option[:option_type] == 2
    OptionGlazing.create(
      name: "sunGlass",
      description: "Double vitrage clair avec intercalaire WE noir 6 rSun 71/38(#2)/16/ + 44.2",
      option: option,
      included: true
    )
  elsif option[:option_type] == 3
    largeur = OptionDimension.where(name: "largeur")[0]
    Section.create(
      option_dimension: largeur,
      option: option,
      
    )
  end

end

# price_lists = [{
#   dimension_1: 1000,
#   dimension_2: 1000,
#   price: 401.69
# },
# {
#   dimension_1: 1500,
#   dimension_2: 1000,
#   price: 474.01
# },
# {
#   dimension_1: 2000,
#   dimension_2: 1000,
#   price: 550.50
# },
# {
#   dimension_1: 2500,
#   dimension_2: 1000,
#   price: 627.00
# },
# {
#   dimension_1: 3000,
#   dimension_2: 1000,
#   price: 699.31
# },
# {
#   dimension_1: 3500,
#   dimension_2: 1000,
#   price: 797.00
# },
# {
#   dimension_1: 4000,
#   dimension_2: 1000,
#   price: 869.32
# },
# {
#   dimension_1: 4500,
#   dimension_2: 1000,
#   price: 1060.69
# },
# {
#   dimension_1: 5000,
#   dimension_2: 1000,
#   price: 1137.18
# },
# {
#   dimension_1: 1000,
#   dimension_2: 1500,
#   price: 446.01
# },
# {
#   dimension_1: 1500,
#   dimension_2: 1500,
#   price: 533.48
# },
# {
#   dimension_1: 2000,
#   dimension_2: 1500,
#   price: 646.33
# },
# {
#   dimension_1: 2500,
#   dimension_2: 1500,
#   price: 852.85
# },
# {
#   dimension_1: 3000,
#   dimension_2: 1500,
#   price: 940.33
# },
# {
#   dimension_1: 3500,
#   dimension_2: 1500,
#   price: 1031.98
# },
# {
#   dimension_1: 4000,
#   dimension_2: 1500,
#   price: 1119.45
# },
# {
#   dimension_1: 4500,
#   dimension_2: 1500,
#   price: 1211.10
# },
# {
#   dimension_1: 5000,
#   dimension_2: 1500,
#   price: 1336.33
# },
# {
#   dimension_1: 1000,
#   dimension_2: 2000,
#   price: 511.52
# },
# {
#   dimension_1: 1500,
#   dimension_2: 2000,
#   price: 614.15
# },
# {
#   dimension_1: 2000,
#   dimension_2: 2000,
#   price: 835.83
# },
# {
#   dimension_1: 2500,
#   dimension_2: 2000,
#   price: 942.64
# },
# {
#   dimension_1: 3000,
#   dimension_2: 2000,
#   price: 1045.27
# },
# {
#   dimension_1: 3500,
#   dimension_2: 2000,
#   price: 1173.28
# },
# {
#   dimension_1: 4000,
#   dimension_2: 2000,
#   price: 1275.91
# },
# {
#   dimension_1: 4500,
#   dimension_2: 2000,
#   price: 1509.97
# },
# {
#   dimension_1: 5000,
#   dimension_2: 2000,
#   price: 1616.78
# },
# {
#   dimension_1: 1000,
#   dimension_2: 2500,
#   price: 670.71
# },
# {
#   dimension_1: 1500,
#   dimension_2: 2500,
#   price: 788.49
# },
# {
#   dimension_1: 2000,
#   dimension_2: 2500,
#   price: 910.46
# },
# {
#   dimension_1: 2500,
#   dimension_2: 2500,
#   price: 1066.00
# },
# {
#   dimension_1: 3000,
#   dimension_2: 2500,
#   price: 1183.79
# },
# {
#   dimension_1: 3500,
#   dimension_2: 2500,
#   price: 1420.63
# },
# {
#   dimension_1: 4000,
#   dimension_2: 2500,
#   price: 1538.42
# },
# {
#   dimension_1: 4500,
#   dimension_2: 2500,
#   price: 1660.38
# },
# {
#   dimension_1: 5000,
#   dimension_2: 2500,
#   price: 1828.55
# }]

# options.each do |option|
#   print ">> #{option[:name]} "
#   option = Option.create(
#     product_id: option[:product_id],
#     option_type: option[:option_type],
#     description: option[:description]
#   )
#   if option.option_type == "dimension"
#     DimensionName.create(
#       dimension_1_name: "largeur",
#       dimension_2_name: "rampant",
#       option_id: option.id
#     )
#     price_lists.each do |price_list|
#       PriceList.create(
#         option_id: option.id,
#         dimension_1: price_list[:dimension_1],
#         dimension_2: price_list[:dimension_2],
#         price: price_list[:price]
#       )
#     end
#   else
#     color = colors.pop
#       Color.create(
#         option_id: option.id,
#         ral: color[:ral],
#         price: color[:price]
#       )
#   end
#   puts "[CREATE]".colorize(:green)
# end
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

final_clients = ThirdParty.where(third_party_type: :final_client).to_ary

relations.each do |relation|
  3.times do
    final_client = final_clients.shift
    final_client_relation = FinalClientRelation.create!(
      relation_id: relation.id,
      final_client_id: final_client.id,
    )
    quote = Quote.create!(
      final_client_relation_id: final_client_relation.id,
      references: Faker::Address.city,
      state: Quote.states.values.sample,
      price: rand(10000..100000),
      state_date: Time.now,
    )
    QuoteProduct.create!(
      product_id: 1,
      quote_id: quote.id,
    )
  end
end

# properties = [
#   {
#   name: "barre",
#   ref: "K6103",
#   description: "Porteur",
#   packing: 7000,
#   product_id: product.id,
#   price_cents: 65_45,
# },
#               {
#   name: "Joint porteur",
#   ref: "U612",
#   description: "Joint porteur",
#   value: 7000,
#   product_id: product.id,
#   price_cents: 33_79,
# },
#               {
#   name: "Serreur",
#   ref: "K6201",
#   description: "Serreur",
#   value: 6000,
#   product_id: product.id,
#   price_cents: 14_06,
# },
#               {
#   name: "Joint serreur",
#   ref: "U622",
#   description: "Joint serreur",
#   value: 250000,
#   product_id: product.id,
#   price_cents: 12_38,
# },
#               {
#   name: "Capots",
#   ref: "K6212",
#   description: "Capots",
#   value: 7000,
#   product_id: product.id,
#   price_cents: 15_63,
# },
#               {
#   name: "Joint rupture mousse",
#   ref: "H241",
#   description: "Joint mousse",
#   value: 6000,
#   product_id: product.id,
#   price_cents: 7_14,
# },
#               {
#   name: "Profil obturation",
#   ref: "T610",
#   description: "Profil lat 1",
#   value: 3500,
#   product_id: product.id,
#   price_cents: 6_70,
# },
#               {
#   name: "Profil obturation",
#   ref: "T612",
#   description: "Profil lat 2",
#   value: 3500,
#   product_id: product.id,
#   price_cents: 4_06,
# },
#               {
#   name: "Tole a commande",
#   ref: "",
#   description: "Toles",
#   value: 1000,
#   product_id: product.id,
#   price_cents: 14_00,
# },
#               {
#   name: "Connecteurs",
#   ref: "",
#   description: "",
#   value: 2,
#   product_id: product.id,
#   price_cents: 2_09,
# },
#               {
#   name: "Vis",
#   ref: "CBP1100",
#   description: "",
#   value: 100,
#   product_id: product.id,
#   price_cents: 25_00,
# },
#               {
#   name: "Vitrage",
#   ref: "",
#   description: "",
#   value: 0.000001,
#   product_id: product.id,
#   price_cents: 60_63,
# },
#               {
#   name: "Compribande",
#   ref: "",
#   description: "",
#   value: 1,
#   product_id: product.id,
#   price_cents: 22_50,
# }]

# properties.each do |item|
#   print "-- #{item[:name].colorize(:blue)} "
#   Propertie.create!(
#     name: item[:name],
#     ref: item[:ref],
#     description: item[:description],
#     value: item[:value],
#     product_id: item[:product_id],
#     price_cents: item[:price_cents],
#   )
#   puts "[CREATE]".colorize(:green)
# end
