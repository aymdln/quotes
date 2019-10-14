class Property < ApplicationRecord
  belongs_to :packing, class_name: 'Variable'
  belongs_to :conso, class_name: 'Variable'
  belongs_to :quantity, class_name: 'Variable'
  belongs_to :order, class_name: 'Variable'

  has_many :color_propreties_dependant
  has_many :glazing_propreties_dependant
  
  monetize :price_cents
end
