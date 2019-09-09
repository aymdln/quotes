class PriceList < ApplicationRecord
  monetize :price_cents
end
