class AddProductsAndCoef < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :third_party, foreign_key: true
      t.integer :category
      t.float :basic_coef
    end

    create_table :relation_coefs do |t|
      t.references :relation, foreign_key: true
      t.references :product, foreign_key: true
      t.float :coef
    
      t.timestamps
    end

  end
end
