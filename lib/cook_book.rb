require 'pry'
require 'date'
require './lib/pantry'
require './lib/ingredient'
require './lib/recipe'

class CookBook
  attr_reader :recipes, :date_created

  def initialize()
    @recipes = []
    date = Date.now
    @date_created = date.strftime("%d-%m-%y")
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    ingredients = []
    @recipes.each do |recipe|
      these_ingredients = recipe.ingredients
       these_ingredients.each do |ingredient|
         ingredients << ingredient.name
       end
    end
    ingredients.uniq
  end

  def highest_calorie_meal
    this_recipe =[@recipes[0]]
    @recipes.each do |recipe|
      if recipe.total_calories > this_recipe[0].total_calories
        this_recipe[0] = recipe
      end
    end
    this_recipe[0]
  end
end
