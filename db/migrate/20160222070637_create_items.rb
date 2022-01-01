class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :desc_en
      t.string :desc_th

      t.timestamps null: false
    end
  end
end
