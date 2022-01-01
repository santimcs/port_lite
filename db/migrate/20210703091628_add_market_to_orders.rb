class AddMarketToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :market, :string
  end
end
