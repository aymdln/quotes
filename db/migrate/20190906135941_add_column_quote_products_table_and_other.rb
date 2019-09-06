class AddColumnQuoteProductsTableAndOther < ActiveRecord::Migration[5.2]
  def change

    create_table :options do |t|
      t.references :product, foreign_key: true
      t.integer :option_type
    
      t.timestamps
    end
    
    create_table :colors do |t|
      t.references :option, foreign_key: true
      t.string :name
      t.string :hexa
      t.monetize :price, currency: { present: false }
    
      t.timestamps
    end
    
    create_table :price_lists do |t|
      t.references :option, foreign_key: true
      t.integer :length_max
      t.integer :width_max
      t.integer :height_max
      t.monetize :price, currency: { present: false }
    
      t.timestamps
    end
    

    add_reference :quote_products, :color, foreign_key: true
    add_reference :quote_products, :price_list, foreign_key: true
  end
end
