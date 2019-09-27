class Quote < ApplicationRecord
  enum state: [{name: "Brouillon", class:"draft"},
    {name: "En cours", class: "progress"},
    {name: "Validé", class:"valid"},
    {name:"Refusé", class:"refuse"}]
  belongs_to :final_client_relation
  has_many :quote_products
  monetize :price_cents
end