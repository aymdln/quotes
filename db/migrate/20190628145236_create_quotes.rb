class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.references :relation, foreign_key: true
      t.references :final_client, foreign_key: { to_table: :third_parties }
      t.string :references
      t.integer :status
      t.date :status_date

      t.timestamps
    end
  end
end
