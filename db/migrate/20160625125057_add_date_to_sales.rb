class AddDateToSales < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :latest_date_id, :integer
  end
end
