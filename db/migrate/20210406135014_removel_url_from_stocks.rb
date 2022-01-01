class RemovelUrlFromStocks < ActiveRecord::Migration[5.1]
  def change
    remove_column :stocks, :url, :string
  end
end
