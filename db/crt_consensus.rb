require 'csv'

class CreateConsensus < ActiveRecord::Base
  records_ins = 0
  records_upd = 0
  CSV.foreach(Rails.root.join("db/consensus.csv"), col_sep: ',', headers: true) do |row|


      consensus = Consensu.where(name: row[0])
      consensu = consensus.first
      if consensu
        consensu.price = row[1] 
        consensu.buy = row[2]
        consensu.hold = row[3] 
        consensu.sell = row[4] 
        consensu.eps_a = row[5] 
        consensu.eps_b = row[6] 
        consensu.pe = row[7] 
        consensu.pbv = row[8]
        consensu.yield = row[9] 
        consensu.consensus_price = row[10] 
        consensu.status = row[11] 
        consensu.save
        records_upd += 1   
      else
        Consensu.find_or_create_by(
        name: row[0], 
        price: row[1], 
        buy: row[2],
        hold: row[3], 
        sell: row[4], 
        eps_a: row[5], 
        eps_b: row[6], 
        pe: row[7], 
        pbv: row[8],
        yield: row[9], 
        consensus_price: row[10], 
        status: row[11],         
        stock_id: 0)
        records_ins += 1
        printf "%10s \n", row[0]
      end
    end

      printf "%2d records add, %2d records update.", records_ins, records_upd

    
sql = "UPDATE consensus SET status = 
      (SELECT status FROM stocks WHERE stocks.name = consensus.name)"
      results = ActiveRecord::Base.connection.execute(sql)
sql = "UPDATE consensus SET status = 'Z' WHERE status IS NULL"
      results = ActiveRecord::Base.connection.execute(sql)    
sql = "UPDATE consensus SET stock_id =
      (SELECT id FROM stocks 
      WHERE stocks.name = consensus.name)"
      results = ActiveRecord::Base.connection.execute(sql)    
end