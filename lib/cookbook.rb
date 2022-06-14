require_relative 'ingredient'
require_relative 'pantry'
require_relative 'recipe'


class CookBook
  attr_accessor :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end


  def ingredients
    all_ingredients = []
    @recipes.each do |recipe|
      recipe.ingredients.each do |ingredient, amount|
        all_ingredients << ingredient.name
      end
    end
    all_ingredients.uniq
  end

  def highest_calorie_meal #come back to to get non array returned
    calories = []
    @recipes.each do |recipe|
      calories << recipe.total_calories
    end
    calories.max
    @recipes.find {|recipe| recipe.total_calories == calories.max}
  end

  def summary
    summary_hash = []
    @recipes.each do |recipe|
      h = Hash.new(0)
      h[:name]=recipe.name
      details_array = []
      recipe.ingredients_required.keys.each do |key|
        i = Hash.new(0)
        i[:ingredient] = key.name
        i[:amount] = (recipe.ingredients_required[key].to_s).concat(key.unit)
        details_array << i
        h[:details] = details_array
        h[:total_calories] = recipe.total_calories
      end
      summary_hash << h
    end
    summary_hash.sort {|values| values[:total_calories]}
  end

  def time

  end
end
