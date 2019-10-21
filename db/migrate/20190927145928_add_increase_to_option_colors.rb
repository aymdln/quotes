class AddIncreaseToOptionColors < ActiveRecord::Migration[5.2]
  def change
    add_column :option_colors, :increase, :integer
    add_reference :option_dimensions, :dimension, foreign_key: { to_table: :variables }
    add_column :option_glazings, :increase, :integer
    add_reference :option_glazings, :option, foreign_key: true

  end
end
