class AddCriteriaToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :bl, :integer, default: 0
    add_column :stocks, :sh, :integer, default: 0
  end
end
