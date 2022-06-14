require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require 'date'

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

  def date
    Date.today.strftime("%m-%d-%Y").to_s
  end

end
