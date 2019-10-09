class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.references :option, foreign_key: true
      t.integer :measure
      t.references :max, foreign_key: { to_table: :variables }
      t.references :calcul, foreign_key: { to_table: :variables }

      t.timestamps
    end
  end
end
