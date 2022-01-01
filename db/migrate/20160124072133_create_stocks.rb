class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :url
      t.decimal :buy_percent, precision: 4, scale: 2
      t.decimal :sell_percent, precision: 4, scale: 2
      t.decimal :max_price, precision: 6, scale: 2
      t.decimal :min_price, precision: 6, scale: 2       

      t.timestamps null: false
    end
  end
end
