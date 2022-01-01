class RemoveIndexFromProfits < ActiveRecord::Migration[5.0]
  def change
    remove_index :profits, [:name, :quarter]
  end
end
