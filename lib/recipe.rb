require_relative 'ingredient'
require_relative 'pantry'

class Recipe
  attr_reader :name
  attr_accessor :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] += amount
  end

  def ingredients
    all_ingredients = []
    @ingredients_required.each do |ingredient, amount|
      all_ingredients << ingredient
    end
    all_ingredients
  end

  def total_calories
    all_calories = []
    @ingredients_required.each do |ingredient, amount|
      all_calories << (ingredient.calories * amount)
    end
    all_calories.sum
  end



end
