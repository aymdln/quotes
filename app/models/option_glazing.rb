class OptionGlazing < ApplicationRecord
  # belongs_to :increase, class_name: 'Variable'
  belongs_to :option
  has_many :glazing_propreties_dependants
end
