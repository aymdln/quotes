class OptionDimension < ApplicationRecord
  belongs_to :dimension, class_name: 'Variable'
  belongs_to :option
  has_many :sections
end
