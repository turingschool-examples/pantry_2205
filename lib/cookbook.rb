class CookBook

	attr_reader :recipes
	def initialize
		@recipes = []
	end

	def add_recipe(recipe)
		@recipes << recipe
	end

	def ingredients
		ingredients = []
		@recipes.each do |recipe|
			recipe.ingredients.each do |ingredient|
				ingredients << ingredient.name
			end
		end
		return ingredients.uniq
	end

	def recipe_by_calories
		recipe_by_calories = Hash.new(0)
		@recipes.each do |recipe|
			recipe_by_calories[recipe] = recipe.total_calories
		end
		return recipe_by_calories
	end

	def highest_calorie_meal
		highest_calorie_meal = []
		recipe_by_calories.each do |recipe, calories|
			if calories >= recipe_by_calories.values.sort.reverse[0]
				highest_calorie_meal << recipe
			else
			end
		end
		return highest_calorie_meal[0]
	end



end
