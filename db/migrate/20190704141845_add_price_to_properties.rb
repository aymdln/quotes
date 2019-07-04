class AddPriceToProperties < ActiveRecord::Migration[5.2]
  def change
    add_monetize :properties, :price, currency: { present: false }
  end
end
