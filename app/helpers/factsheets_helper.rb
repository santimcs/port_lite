module FactsheetsHelper
	def growth(nbr1, nbr2)
		growth = ((nbr1 - nbr2)/nbr2 * 100)
		if (nbr2 < 0)
			growth = growth * -1
		end
		return growth
	end
end
