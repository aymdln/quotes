class Variable < ApplicationRecord
  has_secure_token
  belongs_to :product

  has_many :max, class_name: 'Section', foreign_key: 'max_id'
  has_many :calcul, class_name: 'Section', foreign_key: 'calcul_id'
  has_many :conso, class_name: 'Property', foreign_key: 'conso_id'
  has_many :packing, class_name: 'Property', foreign_key: 'packing_id'
  has_many :quantity, class_name: 'Property', foreign_key: 'quantity_id'
  has_many :order, class_name: 'Property', foreign_key: 'order_id'
  has_many :increase, class_name: 'OptionColor', foreign_key: 'increase_id'
  has_many :increase, class_name: 'OptionGlazing', foreign_key: 'increase_id'
  has_many :dimension, class_name: 'OptionDimension', foreign_key: 'dimension_id'


end
