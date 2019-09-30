class CreateOptionResults < ActiveRecord::Migration[5.2]
  def change
    create_table :option_results do |t|
      t.references :option, foreign_key: true
      t.string :result

      t.timestamps
    end
  end
end
