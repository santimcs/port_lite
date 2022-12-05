class AddXdateToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :xdate, :date, default: '2022-02-02'
  end
end
