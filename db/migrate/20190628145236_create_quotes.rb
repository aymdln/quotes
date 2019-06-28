class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.references :relation, foreign_key: true
      t.references :final_client, foreign_key: { to_table: :third_parties }
      t.string :references
      t.integer :state
      t.date :state_date
    end
  end
end
