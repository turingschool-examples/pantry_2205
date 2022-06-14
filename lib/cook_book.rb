require 'pry'
class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    hash = @recipes.map do |ingredient|
      ingredient.ingredients_required.keys
    end.flatten

    hash.map do |info|
      info.name
    end.uniq
  end

  # def highest_calorie_meal
  #   highest_calorie_meal = []
  #   @recipes.find_all do |recipe|
  #     highest_calorie_meal << recipe.total_calories
  #   end
  #   highest_calorie_meal.max
  # end
end
