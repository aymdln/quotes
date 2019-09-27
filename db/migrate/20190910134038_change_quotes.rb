class ChangeQuotes < ActiveRecord::Migration[5.2]
  def change
    remove_column :quotes, :final_client_id
    remove_column :quotes, :relation_id

    add_reference :quotes, :final_client_relation, foreign_key: true
  end
end
