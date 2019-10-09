class Section < ApplicationRecord
  belongs_to :option
  belongs_to :max, class_name: 'Variable'
  belongs_to :calcul, class_name: 'Variable'
end
