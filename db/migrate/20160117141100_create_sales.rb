class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :name
      t.date :fm_date
      t.date :to_date
      t.integer :days
      t.decimal :fm_price, precision: 6, scale: 2
      t.decimal :to_price, precision: 6, scale: 2
      t.decimal :diff, precision: 5, scale: 2
      t.decimal :pct, precision: 5, scale: 2
      t.integer :ttl_spread
      t.integer :avg_spread
      t.decimal :max_price, precision: 6, scale: 2
      t.decimal :min_price, precision: 6, scale: 2      
      t.integer :qty

      t.timestamps null: false
    end
  end
end
