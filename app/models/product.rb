class Product < ApplicationRecord
  enum category: [:puit_lumiere]
  validates :third_party_id, :category, presence: true
end