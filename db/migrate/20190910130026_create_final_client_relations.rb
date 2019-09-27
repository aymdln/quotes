class CreateFinalClientRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :final_client_relations do |t|
      t.references :relation, foreign_key: true
      t.references :final_client, foreign_key: { to_table: :third_parties }

      t.timestamps
    end
  end
end
