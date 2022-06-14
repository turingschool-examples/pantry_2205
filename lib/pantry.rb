class Pantry

	attr_reader :stock

	def initialize
		@stock = Hash.new(0)
	end

	def stock_check(ingredient_name)
		@stock.each do |ingredient, quantity|
			return quantity if ingredient_name == ingredient
		end
	end

	def restock(ingredient, quantity)
		@stock[ingredient] += quantity
	end
end
