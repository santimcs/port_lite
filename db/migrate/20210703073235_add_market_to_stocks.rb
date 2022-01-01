class AddMarketToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :market, :string
  end
end
