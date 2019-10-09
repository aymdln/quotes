class AddIncreaseToOptionColors < ActiveRecord::Migration[5.2]
  def change
    add_reference :option_colors, :increase, foreign_key: { to_table: :variables }
    add_reference :option_dimensions, :dimension, foreign_key: { to_table: :variables }
    add_reference :option_glazings, :increase, foreign_key: { to_table: :variables }

  end
end
