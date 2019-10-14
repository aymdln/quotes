class OptionResult < ApplicationRecord
  belongs_to :option
  has_many :quote_products
end
