class Sale < ActiveRecord::Base
    belongs_to :latest_date
    validates_uniqueness_of :name, scope: [:fm_date, :to_date]
   
	default_scope { order('name ASC, fm_date DESC')}

    scope :buy_alert, -> {
        joins(:latest_date).
        where("to_date = date")
    }

    scope :sell_alert, -> {
        joins(:latest_date).        
        where("to_date = date")
    }

    scope :short_sell, -> {
        joins(:latest_date).        
        where("to_date = date")
    }
    scope :cover_buy, -> {
        joins(:latest_date).        
        where("to_date = date")
    }

	before_save :assign_values

    def self.to_csv(attributes = column_names, options = {})
        CSV.generate(options) do |csv|
            attributes = %w(name fm_date to_date fm_price to_price qty max_price min_price)
            csv.add_row attributes
            all.each do |sale|
                values = sale.attributes.slice(*attributes).values
                csv.add_row values
            end
        end
    end
	
		def num_of_spread(minp,maxp)
    div = 0.0
    gap = 0.0
    spd = 0
    if (maxp > minp) 
    	gap = maxp - minp
    	mult = 1
    else
    	tmpp = minp
    	minp = maxp
    	maxp = tmpp
    	gap  = maxp - minp
    	mult = -1
    end
    if gap != 0
    case maxp
    	when 0.00..2.00 then 
        begin
            div = 0.01 
            spd = gap/div
        end
    	when 2.02..5.00 then 
        begin
    		div = 0.02
    		if minp < (div * 100)
    			spd = ((div * 100) - minp) / 0.01
    			spd += (maxp - (div * 100)) / div
    		else
    			spd = gap/div
            end
    	end      
    	when 5.05..10.00 then  
        begin
    		div = 0.05
    		if minp < (div * 100)
    			spd = ((div * 100) - minp) / 0.02
    			spd += (maxp - (div * 100)) / div
    		else
    			spd = gap/div
           end            
    	end      
    	when 10.10..25.00 then 
    	begin
    		div = 0.10
    		if minp < (div * 100)
    			spd = ((div * 100) - minp) / 0.05
    			spd += (maxp - (div * 100)) / div
    		else
    			spd = gap/div
           end          
    	end   
    	when 25.25..100.00 then 
    	begin
    		div = 0.25
    		if minp < (div * 100)
    			spd = ((div * 100) - minp) / 0.10
    			spd += (maxp - (div * 100)) / div
    		else
    			spd = gap/div
           end            
    	end    
    	when 100.50..200.00 then 
    	begin
    		div = 0.50
    		if minp < (div * 100)
    			spd = ((div * 100) - minp) / 0.25
    			spd += (maxp - (div * 100)) / div
    		else
    			spd = gap/div
            end             
    	end      
    	when 201.00..400.00 then 
    	begin
    		div = 1.00
    		if minp < (div * 200)
    			spd = ((div * 200) - minp) / 0.50
    			spd += (maxp - (div * 200)) / div
    		else
    			spd = gap/div
           end            
    	end   
    	else 
    	begin
    		div = 2.00
    		if minp < (div * 200)
    			spd = ((div * 200) - minp) / 1.00
    			spd += (maxp - (div * 200)) / div
    		else
    			spd = gap/div
           end            
    	end         
    end	
	end
	return spd * mult
end

	def assign_values
		# days
		self.days = 0
		d1 = self.fm_date
		d2 = self.to_date
		while (d1 < d2)
			d1 = d1 + 1
			if d1.cwday < 6
				self.days = self.days + 1
			end
		end
		# diff
		self.diff = self.to_price - self.fm_price
		self.pct = self.diff/self.fm_price*100
		self.ttl_spread = num_of_spread(self.fm_price,self.to_price)
		self.avg_spread = (self.ttl_spread / self.days).round
        if (self.to_price > self.max_price)
            self.max_price = self.to_price
        end
        if (self.to_price < self.min_price)
            self.min_price = self.to_price
        end        
	end

end
