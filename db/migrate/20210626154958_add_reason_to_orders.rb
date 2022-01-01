class AddReasonToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :reason, :string
  end
end
