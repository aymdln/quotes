class CreateGlazingPropretiesDependants < ActiveRecord::Migration[5.2]
  def change
    create_table :glazing_propreties_dependants do |t|
      t.references :property, foreign_key: true
      t.references :option_glazing, foreign_key: true

      t.timestamps
    end
  end
end
