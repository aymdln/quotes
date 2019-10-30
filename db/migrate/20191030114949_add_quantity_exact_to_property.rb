class AddQuantityExactToProperty < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :order_exact_quantity, :boolean, default: false
  end
end
