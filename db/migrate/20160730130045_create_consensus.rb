class CreateConsensus < ActiveRecord::Migration[5.0]
  def change
    create_table :consensus do |t|
      t.string :name
      t.decimal :price
      t.integer :buy
      t.integer :hold
      t.integer :sell
      t.decimal :eps_a
      t.decimal :eps_b
      t.decimal :pe
      t.decimal :pbv
      t.decimal :yield
      t.decimal :consensus_price
      t.string :status
      t.integer :stock_id
    end
    add_index :consensus, :name, unique: true
  end
end
