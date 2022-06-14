require './lib/recipe'
require './lib/ingredient'

class CookBook
  attr_reader :recipes
  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    @recipes.flat_map do |recipe|
      recipe.ingredients_required.flat_map do |ingredient, _quantity|
        ingredient.name
        end
      end.uniq
  end

  def highest_calorie_meal
     @recipes.select.max do |recipe|
      recipe.total_calories
    end
  end

end
