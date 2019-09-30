class OptionDimension < ApplicationRecord
  belongs_to :dimension_1, class_name: 'Variable'
  belongs_to :dimension_2, class_name: 'Variable'
  belongs_to :option
end
