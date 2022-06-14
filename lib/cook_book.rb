require './lib/recipe'
require 'time'

class CookBook
  attr_reader :recipes, :date

  def initialize
    @recipes = []
    @date = (Time.now).strftime('%m-%d-%Y')
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
    ingredients.uniq!
  end

  def highest_calorie_meal
    @recipes.max_by { |recipe| recipe.total_calories }
  end

  # def summary
  #   output_array = []
  #   @recipes.each do |recipe|
  #     hash_to_append[:name] = recipe.name
  #     hash_to_append[:details]
  #   end
  #
  # end
end
