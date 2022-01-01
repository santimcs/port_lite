require 'csv'

class CrtSales < ActiveRecord::Base
	records = 0
  CSV.foreach(Rails.root.join("db/sales.csv"), headers: false) do |row|

      Sale.find_or_create_by(name: row[0], fm_date: row[1], to_date: row[2],
      days: row[3], fm_price: row[4], to_price: row[5], 
      diff: row[6], pct: row[7], ttl_spread: row[8], avg_spread: row[9],
      max_price: row[10], min_price: row[11], qty: row[12], latest_date_id: 1)
      records += 1
  end
  p records
end