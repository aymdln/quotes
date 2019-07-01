class QuoteProduct < ApplicationRecord
  belongs_to :product
  belongs_to :quote
  validates :product_id, :quote_id, presence: true
end