class AddSpreadToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :buy_spread, :integer
    add_column :stocks, :sell_spread, :integer
  end
end
