require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'

class CookBook

  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def highest_calorie_meal
    @recipes.max_by {|recipe| recipe.total_calories}
  end

end
