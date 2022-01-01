require 'csv'

class CrtFactsheets < ActiveRecord::Base
	records = 0
  CSV.foreach(Rails.root.join("db/factsheet.csv"), headers: false) do |row|

      Factsheet.find_or_create_by(name: row[0], item_id: row[1], figure1: row[2],
      figure2: row[3], figure3: row[4], figure4: row[5])
      records += 1
  end
  p records
end