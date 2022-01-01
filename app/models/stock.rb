class Stock < ActiveRecord::Base
	has_one :consensu

	validates :name, uniqueness: true
	validates :buy_spread, numericality: {
		less_than_or_equal_to: -2
	}
	validates :sell_spread, numericality: {
		greater_than_or_equal_to: 2
	}

  	STATUS = [
  		  "B",	
          "I",
          "O",
          "S",
          "T",
          "U",
          "X"		
        ]

end
