class AddReasonToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :reason, :string
  end
end
