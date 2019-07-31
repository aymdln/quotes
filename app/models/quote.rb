class Quote < ApplicationRecord
  enum state: [{name: "Brouillon", class:"draft"},
    {name: "En cours", class: "progress"},
    {name: "Validé", class:"valid"},
    {name:"Refusé", class:"refuse"}]
  belongs_to :relation
  belongs_to :final_client, class_name: "ThirdParty"
  has_many :quote_products
  monetize :price_cents
end