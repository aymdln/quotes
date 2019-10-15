class AddIncludedToOptionsGlazingColorsEtc < ActiveRecord::Migration[5.2]
  def change
    add_column :option_colors, :included, :boolean
    add_column :option_glazings, :included, :boolean
  end
end
