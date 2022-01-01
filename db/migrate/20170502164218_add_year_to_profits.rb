class AddYearToProfits < ActiveRecord::Migration[5.0]
  def change
    add_column :profits, :year, :integer
  end
end
