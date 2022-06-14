require './lib/recipe'
require './lib/ingredient'
require 'date'

class Cookbook
  attr_reader :recipes,
              :ingredients,
              :date

  def initialize
    @recipes = []
    @date = Date.today
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    @ingredients = []
    @recipes.each do |recipe|
      recipe.ingredients_required.each do |ingredient|
        @ingredients << ingredient[0].name

      end
    end
    return @ingredients.uniq
  end

  def highest_calorie_meal
    calorie_count = []
    @recipes.each do |recipe|
      calorie_count << recipe.total_calories
    end
    @recipes.each do |recipe|
      if recipe.total_calories == calorie_count.max
        return recipe
      end
    end
  end


end
