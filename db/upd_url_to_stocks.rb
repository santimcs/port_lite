require 'csv'

def commas(x)
  str = x.to_s.reverse
  str.gsub!(/([0-9]{3})/,"\\1,")
  str.gsub(/,$/,"").reverse
end

class UpdUrlToStocks < ActiveRecord::Base
	records_ins = 0
  records_upd = 0  
  CSV.foreach(Rails.root.join("db/url.csv"), headers: false) do |row|


        stocks = Stock.where(name: row[0]).limit(1)
        stock = stocks.first
        if stock
          stock.url = row[1]

          printf "%-8s %-50s\n", 
          row[0], row[1]
          stock.save
          records_upd += 1
        end      

    end

  printf "%2d records added, %2d records updated.", records_ins, records_upd
end