class Property < ApplicationRecord
  belongs_to :packing, class_name: 'Variable'
  belongs_to :conso, class_name: 'Variable'
  belongs_to :quantity, class_name: 'Variable'
  belongs_to :order, class_name: 'Variable'
  belongs_to :price, class_name: 'Variable'

end
