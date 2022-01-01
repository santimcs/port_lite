require 'csv'

def commas(x)
  str = x.to_s.reverse
  str.gsub!(/([0-9]{3})/,"\\1,")
  str.gsub(/,$/,"").reverse
end

class CrtSales < ActiveRecord::Base
	records_ins = 0
  records_upd = 0  
  CSV.foreach(Rails.root.join("db/daily_out.csv"), headers: false) do |row|
  	if (row[10] == 'Insert')
      Sale.find_or_create_by(name: row[0], fm_date: row[1], to_date: row[2],
      fm_price: row[3], to_price: row[4], 
      qty: row[6], max_price: row[7], min_price: row[8], latest_date_id: 1)
      
      printf "%8s %10s %10s %6.2f %6.2f %13s %6.2f %6.2f %7s\n", 
      row[0], row[1], row[2], row[3], row[4],
      commas(row[6]), row[7], row[8], row[10]      
      records_ins += 1

    else

        sales = Sale.where(name: row[0], fm_date: row[1]).limit(1)
        sale = sales.first
        if sale
          sale.to_date = row[2]
          sale.to_price = row[4]
          sale.qty = (sale.qty + row[6].to_i)
          sale.max_price = row[7].to_f
          sale.min_price = row[8].to_f
      
          printf "%8s %10s %10s %6.2f %6.2f %13s %6.2f %6.2f %7s\n", 
          row[0], row[1], sale.to_date, sale.fm_price, row[4],
          commas(sale.qty), row[7], row[8], row[10]
          sale.save
          records_upd += 1
        end      

    end
  end
  printf "%2d records added, %2d records updated.", records_ins, records_upd
end