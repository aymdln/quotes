class CreateProfils < ActiveRecord::Migration[5.2]
  def change
    
    create_table :third_parties do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :zip
      t.string :country
      t.string :mail
      t.string :web
      t.string :tva
      t.string :siret
      t.string :siren
      t.string :phone
      t.integer :type
    
      t.timestamps
    end

    add_reference :users, :third_party, foreign_key: true
    
  end
end
