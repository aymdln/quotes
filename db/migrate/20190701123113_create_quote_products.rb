class CreateQuoteProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :quote_products do |t|
      t.references :product, foreign_key: true
      t.references :quote, foreign_key: true

      t.timestamps
    end
  end
end
