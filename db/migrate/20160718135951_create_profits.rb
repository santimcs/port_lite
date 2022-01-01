class CreateProfits < ActiveRecord::Migration[5.0]
  def change
    create_table :profits do |t|
      t.string :name
      t.string :quarter
      t.integer :latest_profit
      t.integer :previous_profit
      t.integer :inc_profit
      t.decimal :inc_percent, precision: 6, scale: 2

    end
    add_index :profits, [:name, :quarter], unique: true
  end
end
