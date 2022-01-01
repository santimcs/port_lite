class CreateFactsheets < ActiveRecord::Migration
  def change
    create_table :factsheets do |t|
      t.string :name
      t.references :item, index: true, foreign_key: true
      t.decimal :figure1, precision: 9, scale: 2
      t.decimal :figure2, precision: 9, scale: 2
      t.decimal :figure3, precision: 9, scale: 2
      t.decimal :figure4, precision: 9, scale: 2

      t.timestamps null: false
    end
  end
end
