class ChangeIntegerSizeInStocks < ActiveRecord::Migration
  def change
  	change_column :sales, :qty, :bigint
  end
end
