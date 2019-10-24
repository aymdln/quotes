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

puts "==> #{"Options".colorize(:magenta)}}"

options = [{
  name: "Dimensions",
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
  if option.option_type == "dimension"
    print "LARGEUR "
    OptionDimension.create(
      name: "largeur",
      option: option,
      value: "",
    )
    puts "[CREATE]".colorize(:green)
    print "RAMPANT "
    OptionDimension.create(
      name: "rampant",
      option: option,
      value: "",
    )
    puts "[CREATE]".colorize(:green)
  elsif option.option_type == "color"
    print "COLOR "
    option_colors.each do |color|
      OptionColor.create(
        name: color[:name],
        color_type: :ral,
        option: option,
        color_value: color[:ral],
        included: true,
      )
    end
    puts "[CREATE]".colorize(:green)
  elsif option.option_type == "glazing"
    print "GLAZING "
    OptionGlazing.create(
      name: "sunGlass",
      description: "Double vitrage clair avec intercalaire WE noir 6 rSun 71/38(#2)/16/ + 44.2",
      option: option,
      included: true,
    )
    puts "[CREATE]".colorize(:green)
  elsif option.option_type == "section"
    print "SECTION "
    largeur = OptionDimension.where(name: "largeur")[0]
    section = Section.create(
      option_dimension: largeur,
      option: option,
      value_max: "700.0",
    )
    section.value_calcul = "({{#{largeur.dimension.token}}}/{{#{section.max.token}}}).ceil"
    section.save
    puts "[CREATE]".colorize(:green)
  end
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


calcul_section = product.options.where(option_type: 3).first.sections.first.calcul
rampant = OptionDimension.where(name:"rampant").first.dimension

longueur_des_porteurs = Variable.create(product_id: product.id, name:"longeur_des_porteurs", value: "{{#{rampant.token}}}+70")

variables = [
  {
    name: "nombre de porteur",
    value: "{{#{calcul_section}}}+1"
  },
  {
    name: "longueur des porteurs",
    value: "{{#{rampant}}}"
  }
]



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
