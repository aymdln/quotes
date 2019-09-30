class AddOptionResultsToQuoteProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :quote_products, :option_result, foreign_key: true
  end
end
