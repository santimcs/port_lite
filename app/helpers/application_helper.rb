module ApplicationHelper

    def link_to_icon(icon_name, url_or_object, options={})
        options.merge!({ :class => "icon #{icon_name}" })

        link_to(image_tag("icons/#{icon_name}.png", { :title => icon_name }),
                      url_or_object,
                      options)
    end
    
    def status_desc(status)
        case status
        when 'B'
            status_desc = 'Both'            
        when 'I'
            status_desc = 'In_Port'
        when 'O'
            status_desc = 'Other'
        when 'S' 
            status_desc = 'Short'
        when 'T' 
            status_desc = 'Hi-Div'            
        when 'U' 
            status_desc = 'Hi-Pot'         
        when 'X' 
            status_desc = 'Unknown'                   
        end     
    end

    def trade_desc(trade)
        case trade
        when 'B'
            trade_desc = 'Buy'            
        when 'S' 
            trade_desc = 'Sell'                             
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
                boundary = div * 100
    		    if minp < boundary
    			    spd = (boundary - minp) / 0.01
    			    spd += (maxp - boundary) / div
    		    else
    			    spd = gap/div
                end
    	    end      
    	    when 5.05..10.00 then  
            begin
    		    div = 0.05
                boundary = div * 100
    		    if minp < boundary
    			    spd = (boundary - minp) / 0.02
    			    spd += (maxp - boundary) / div
    		    else
    			    spd = gap/div
                end            
    	    end      
    	    when 10.10..25.00 then 
    	    begin
    		    div = 0.10
                boundary = div * 100
    		    if minp < boundary
    			    spd = (boundary - minp) / 0.05
    			    spd += (maxp - boundary) / div
    		    else
    			    spd = gap/div
                end          
    	    end   
    	    when 25.25..100.00 then 
    	    begin
    		    div = 0.25
                boundary = div * 100
    		    if minp < boundary
    			    spd = (boundary - minp) / 0.10
    			    spd += (maxp - boundary) / div
    		    else
    			    spd = gap/div
                end            
    	    end    
    	    when 100.50..200.00 then 
    	    begin
    		    div = 0.50
                boundary = div * 200
    		    if minp < boundary
    			    spd = (boundary - minp) / 0.25
    			    spd += (maxp - boundary) / div
    		    else
    			    spd = gap/div
                end             
    	    end      
    	    when 201.00..400.00 then 
    	    begin
    		    div = 1.00
                boundary = div * 200                
    		    if minp < boundary
    			    spd = (boundary - minp) / 0.50
    			    spd += (maxp - boundary) / div
    		    else
    			    spd = gap/div
                end            
    	    end   
    	    else 
    	    begin
    		    div = 2.00
                boundary = div * 200
    		    if minp < boundary
    			    spd = (boundary - minp) / 1.00
    			    spd += (maxp - boundary) / div
    		    else
    			    spd = gap/div
                end            
    	    end         
        end	
	end
	return spd * mult
end

    def targetted(price)
        units = 0
        case price
        when  0.01..1.99
            units = (price/0.01).round
            price = ((units + spread) * 0.01)            
        when  2.00..4.99
            units = (price/0.02).round
            price = ((units + spread) * 0.02)
        when 5.00..9.99
            units = (price/0.05).round
            price = ((units + spread) * 0.05)
        when 10.00..24.99
            units = (price/0.10).round
            price = ((units + spread) * 0.10)
        when 25.00..99.99
            units = (price/0.25).round
            price = ((units + spread) * 0.25) 
        when 100.00..199.99
            units = (price/0.50).round
            price = ((units + spread) * 0.50)   
        when 200.00..399.99
            units = (price/1.00).round
            price = ((units + spread) * 1.00)       
        when 400.00..9999.99
            units = (price/2.00).round
            price = ((units + spread) * 2.00)                                      
        end
#        return price
    end            

def goal(price,spread)
        units = 0
        case price
        when  0.01..1.99
            if (spread > 0)
                spread.downto(1) do |x|
                    if (price >= 2)
                        adder = 0.02
                    else
                        adder = 0.01
                    end
                    puts x
                    puts adder
                    price = (price + adder).round(2)    
                    puts price    
                end
            else
                spread.upto(-1) do |x|

                        adder = -0.01
 
                    puts x
                    puts adder
                    price = (price + adder).round(2)    
                    puts price     
                end
            end
                             
        when  2.00..4.99

            if (spread > 0)
                spread.downto(1) do |x|
                    if (price >= 5.0)
                        adder = 0.05
                    else
                        adder = 0.02
                    end
                    puts x
                    puts adder
                    price = (price + adder).round(2)    
                    puts price 
                end
            else    
                spread.upto(-1) do |x|
                    if (price <= 2.0)
                        adder = -0.01
                    else
                        adder = -0.02
                    end
                    puts x
                    puts adder
                    price = (price + adder).round(2)    
                    puts price     
                end
            end
     
        when 5.00..9.99

            if (spread > 0)
                spread.downto(1) do |x|
                    if (price >= 10)
                        adder = 0.10
                    else
                        adder = 0.05
                    end
                    puts x
                    puts adder
                    price = (price + adder).round(2)    
                    puts price    
                end
            end
            if (spread < 0)
                spread.upto(-1) do |x|
                    if (price <= 5)
                        adder = -0.02
                    else
                        adder = -0.05
                    end
                    puts x
                    puts adder
                    price = (price + adder).round(2)    
                    puts price     
                end
            end
        
        when 10.00..24.99

            if (spread > 0)
                spread.downto(1) do |x|
                    if (price >= 25)
                        adder = 0.25
                    else
                        adder = 0.10
                    end
                    puts x
                    puts adder
                    price = (price + adder).round(2)    
                    puts price    
                end
            end
            if (spread < 0)
                spread.upto(-1) do |x|
                    if (price <= 10)
                        adder = -0.05
                    else
                        adder = -0.10
                    end
                    puts x
                    puts adder
                    price = (price + adder).round(2)    
                    puts price     
                end
            end
        
        when 25.00..99.99

            if (spread > 0)
                spread.downto(1) do |x|
                    if (price >= 100)
                        adder = 0.50
                    else
                        adder = 0.25
                    end
                    puts x
                    puts adder
                    price = (price + adder).round(2)    
                    puts price    
                end
            end
            if (spread < 0)
                spread.upto(-1) do |x|
                    if (price <= 25)
                        adder = -0.10
                    else
                        adder = -0.25
                    end
                    puts x
                    puts adder
                    price = (price + adder).round(2)    
                    puts price     
                end
            end
        
        when 100.00..199.99

            if (spread > 0)
                spread.downto(1) do |x|
                    if (price >= 200)
                        adder = 1.0
                    else
                        adder = 0.50
                    end
                    puts x
                    puts adder
                    price = (price + adder).round(2)    
                    puts price    
                end
            end
            if (spread < 0)
                spread.upto(-1) do |x|
                    if (price <= 100)
                        adder = -0.25
                    else
                        adder = -0.50
                    end
                    puts x
                    puts adder
                    price = (price + adder).round(2)    
                    puts price     
                end
            end
        
        when 200.00..399.99

            if (spread > 0)
                spread.downto(1) do |x|
                    if (price >= 400)
                        adder = 2.0
                    else
                        adder = 1.0
                    end
                    puts x
                    puts adder
                    price = (price + adder).round(2)    
                    puts price    
                end
            end
            if (spread < 0)
                spread.upto(-1) do |x|
                    if (price <= 200)
                        adder = -0.5
                    else
                        adder = -1.0
                    end
                    puts adder
                    price = (price + adder).round(2)    
                    puts price     
                end
            end
     
        when 400.00..9999.99
            if (spread > 0)
                spread.downto(1) do |x|

                        adder = 2.0

                    puts x
                    puts adder
                    price = (price + adder).round(2)    
                    puts price    
                end
            end
            if (spread < 0)
                spread.upto(-1) do |x|
                    if (price <= 400)
                        adder = -1
                    else
                        adder = -2.0
                    end
                    puts x
                    puts adder
                    price = (price + adder).round(2)    
                    puts price     
                end
            end
                                         
        end
        return price
    end             

end
