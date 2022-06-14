require 'recipe'
require 'ingredient'
require 'date'

class CookBook

  attr_reader :recipes, :date

  def initialize
    @recipes = []
    @date = Date.today
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    total = []
    @recipes.each do |recipe|
      total << recipe.ingredients
    end
    total.flatten.uniq
  end

  def highest_calorie_meal
    list = {}
    @recipes.each do |recipe|
      list[recipe] = recipe.total_calories
    end
    list.sort_by {|recipe, calories| calories}.flatten.reverse[1]
  end

  def summary
    list = []
    list2 = {}
    list << list2
    @recipes.each do |recipe|
      list2[recipe] = recipe.ingredients_required.map do |ingredient, num|
        list2[recipe] = ingredient = ingredient.calories * num
      end
    end
      require 'pry'; binding.pry
    list
  end

end
