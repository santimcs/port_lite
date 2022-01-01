class DropDatesFromStocks < ActiveRecord::Migration[5.1]
  def change
      remove_column :stocks, :created_at, :datetime
      remove_column :stocks, :updated_at, :datetime
  end
end
