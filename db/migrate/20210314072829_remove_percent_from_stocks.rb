class RemovePercentFromStocks < ActiveRecord::Migration[5.1]
  def change
    remove_column :stocks, :buy_percent, :decimal
    remove_column :stocks, :sell_percent, :decimal
  end
end
