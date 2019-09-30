class AddColumnQuoteProductsTableAndOther < ActiveRecord::Migration[5.2]
  def change

    create_table :options do |t|
      t.references :product, foreign_key: true
      t.integer :option_type
      t.text :description
    
      t.timestamps
    end
    
    create_table :option_colors do |t|
      t.references :option, foreign_key: true
      t.string :name
      t.string :ral
    
      t.timestamps
    end

    create_table :option_dimensions do |t|
      t.references :option, foreign_key: true
      t.string :dimension_1_name
      t.string :dimension_2_name

      t.timestamps
    end

    create_table :option_glazings do |t|
      t.string :name
      t.text :description
    
      t.timestamps
    end
    

  end
end
