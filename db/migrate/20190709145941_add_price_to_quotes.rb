class AddPriceToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_monetize :quotes, :price, currency: { present: false }
  end
end
