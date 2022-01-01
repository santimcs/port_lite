class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :trade
      t.string :name
      t.integer :qty
      t.decimal :price, precision: 6, scale: 2
      t.decimal :amount, precision: 9, scale: 2
      t.boolean :active

    end
  end
end
