class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :name
      t.text :description
      t.float :value
      t.string :ref
      t.references :product, foreign_key: true
    end
  end
end
