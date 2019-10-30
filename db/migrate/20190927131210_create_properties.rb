class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :ref
      t.string :description
      t.references :product
      t.references :conso, foreign_key: { to_table: :variables }
      t.references :packing, foreign_key: { to_table: :variables }
      t.monetize :price, currency: { present: false }

      t.timestamps
    end
  end
end
