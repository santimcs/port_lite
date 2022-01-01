require 'csv'

class CrtProfits < ActiveRecord::Base
	records_ins = 0
	records_upd = 0
  	CSV.foreach(Rails.root.join("db/profits.csv"), headers: false) do |row|
        profits = Profit.where(name: row[0], quarter: row[1]).limit(1)
        profit = profits.first
        if profit
    		  profit.latest_profit = row[2]
      		profit.previous_profit = row[3]
      		profit.inc_profit = row[4]
      		profit.inc_percent = row[5] 
      		records_upd += 1
      		profit.save
      	else
      		Profit.find_or_create_by(name: row[0], quarter: row[1], latest_profit: row[2],
      		previous_profit: row[3], inc_profit: row[4], 
      		inc_percent: row[5])	
      		records_ins += 1
  		end
  	end
  	printf "%2d records added, %2d records updated.", records_ins, records_upd
end