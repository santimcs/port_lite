class ChangeActiveFromBoolToInt < ActiveRecord::Migration[5.1]
  def change
    reversible do |dir|
      change_table :orders do |t|
        dir.up   { t.change :active, :integer}
        dir.down { t.change :active, :boolean }
      end
    end    
  end
end
