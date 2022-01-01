class AddStatusToStocks < ActiveRecord::Migration
  def change
  	add_column :stocks, :status, :string, default: 'O'
  	add_column :stocks, :buy_target, :decimal, precision: 6, scale: 2
  	add_column :stocks, :sell_target, :decimal, precision: 6, scale: 2
  	add_column :stocks, :volume, :decimal, precision: 6, scale: 2
  	add_column :stocks, :beta, :decimal, precision: 3, scale: 2
  	add_column :stocks, :cost, :decimal, precision: 6, scale: 2

  end
end
