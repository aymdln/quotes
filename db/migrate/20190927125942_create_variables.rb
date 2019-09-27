class CreateVariables < ActiveRecord::Migration[5.2]
  def change
    create_table :variables do |t|
      t.string :name
      t.string :token
      t.string :value

      t.timestamps
    end
    add_index :variables, :token, unique: true
  end
end
