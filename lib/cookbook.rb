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


end
