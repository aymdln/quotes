class AddColumnQuoteProductsTableAndOther < ActiveRecord::Migration[5.2]
  def change

    create_table :options do |t|
      t.references :product, foreign_key: true
      t.integer :option_type
      t.text :description
    
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
      t.integer :dimension_1
      t.integer :dimension_2
      t.monetize :price, currency: { present: false }
    
      t.timestamps
    end

    create_table :dimension_names do |t|
      t.references :option, foreign_key: true
      t.string :dimension_1_name
      t.string :dimension_2_name

      t.timestamps
    end
    
    

    add_reference :quote_products, :color, foreign_key: true
    add_reference :quote_products, :price_list, foreign_key: true
  end
end
