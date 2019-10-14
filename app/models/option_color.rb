class OptionColor < ApplicationRecord
  has_many :color_propreties_dependants
  belongs_to :option
  belongs_to :increase, class_name: 'Variable'
end
