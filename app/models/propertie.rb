class Propertie < ApplicationRecord
  belongs_to :product
  validates :product_id, presence: true
  monetize :price_cents
end