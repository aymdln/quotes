class Product < ApplicationRecord
  enum category: [:puit_lumiere]
  validates :third_party_id, :category, presence: true
  has_many :quote_produts
end