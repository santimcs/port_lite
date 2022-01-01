require 'csv'

def commas(x)
  str = x.to_s.reverse
  str.gsub!(/([0-9]{3})/,"\\1,")
  str.gsub(/,$/,"").reverse
end

class UpdSales < ActiveRecord::Base
	records_upd = 0
  	CSV.foreach(Rails.root.join("db/daily_out.csv"), headers: false) do |row|
  		if (row[10] == 'Update')
  			sales = Sale.where(name: row[0], fm_date: row[1])
  			first = sales[0]
  			if first
  			#	puts first.max_price
  				first.to_date = row[2]
  				first.to_price = row[4]
  				first.qty = (first.qty + row[5].to_i)
 				first.max_price = row[6].to_f
 				first.min_price = row[7].to_f
			
 				printf "%8s %10s %10s %6.2f %6.2f %13s %6.2f %6.2f %7s\n", 
 				row[0], row[1], first.to_date, first.fm_price, row[4],
 				commas(first.qty), row[6], row[7], row[10]
				first.save
      			records_upd += 1
  			end
    	end
  	end
  	printf "%2d records updated\n", records_upd
end