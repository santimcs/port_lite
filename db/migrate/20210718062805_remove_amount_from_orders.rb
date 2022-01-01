class RemoveAmountFromOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :amount
  end
end
