require_relative 'recipe'
class CookBook
  attr_reader :recipes, :date

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    ingredients_name = []
    @recipes.each do |recipe|
      recipe.ingredients.each do |ingredient|
        ingredients_name << ingredient.name
      end
    end
    ingredients_name.uniq!
  end

  def highest_calorie_meal
    recipes_with_calories = Hash.new(0)
    @recipes.each do |recipe|
      recipes_with_calories[recipe] += recipe.total_calories
    end
    by_highest = recipes_with_calories.sort_by {|key, value| value}.reverse.to_h
    return by_highest.keys.first
  end
end
