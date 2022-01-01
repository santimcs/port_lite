require 'csv'

# def commas(x)
#   str = x.to_s.reverse
#   str.gsub!(/([0-9]{3})/,"\\1,")
#   str.gsub(/,$/,"").reverse
# end

class UpdStocks < ActiveRecord::Base
	records_ins = 0
  records_upd = 0  
#printf "%-8s %10s %4s %6s %6s\n", 
   puts "Name      Daily Vol Beta    Max    Min"
   puts "--------------------------------------"

  CSV.foreach(Rails.root.join("db/factsheet.csv"), headers: false) do |row|


        stocks = Stock.where(name: row[0]).limit(1)
        stock = stocks.first
        if stock
          stock.volume = row[1]
          stock.beta = row[2]
          stock.max_price = row[3]
          stock.min_price = row[4]

          printf "%-8s %10s %4s %6s %6s\n", 
          row[0], row[1], row[2], row[3], row[4]
          stock.save
          records_upd += 1
        end      

    end

  printf "%2d records added, %2d records updated.", records_ins, records_upd
end