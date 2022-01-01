class AddIndexToProfits < ActiveRecord::Migration[5.0]
  def change
    add_index :profits, [:name, :year, :quarter], unique: true  	
  end
end
