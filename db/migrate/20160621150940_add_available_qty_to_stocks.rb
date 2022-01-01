class AddAvailableQtyToStocks < ActiveRecord::Migration[5.0]
  def change
  	add_column :stocks, :available_qty, :integer
  end
end
