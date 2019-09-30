class CreateColorPropretiesDependants < ActiveRecord::Migration[5.2]
  def change
    create_table :color_propreties_dependants do |t|
      t.references :property, foreign_key: true
      t.references :option_color, foreign_key: true

      t.timestamps
    end
  end
end
