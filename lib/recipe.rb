require 'pry'
require './lib/pantry'
require './lib/ingredient'
require './lib/cook_book'

class Recipe
  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, amount_needed)
    if @ingredients_required.include?(ingredient)
      @ingredients_required[ingredient] += amount_needed
    else
      @ingredients_required[ingredient] = amount_needed
    end
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    total_calories = 0
    @ingredients_required.each do |ingredient, amount|
      total_calories += (ingredient.calories * amount)
    end
    total_calories
  end
end
