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

	def enough_ingredients_for?(recipe)
		enough_ingredients_for = false
		recipe.ingredients_required.each do |ingredient, quantity|
			enough_ingredients_for = true if stock_check(ingredient) == quantity
		end
		return enough_ingredients_for
	end
end
