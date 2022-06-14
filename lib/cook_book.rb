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
      recipe.ingredients_required.keys.map do |ingredient|
        ingredient.name
      end
    end
  end
#
  def highest_calorie_meal
    @recipes.flat_map do |recipe|
      recipe.ingredients_required.keys.map do |ingredient|
        # require "pry"; binding.pry
        ingredient.calories
        end
      end
    end
  end
