class CreateJoinTableThirdPartyThirdParty < ActiveRecord::Migration[5.2]
  def change
    create_table :relations do |t|
      t.references :manufacturer, foreign_key: { to_table: :third_parties }
      t.references :client, foreign_key: { to_table: :third_parties }

      t.timestamps
    end
  end
end
