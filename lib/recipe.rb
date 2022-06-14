require './lib/pantry'

class Recipe
  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, quantity)
    if @ingredients_required.keys.include?(ingredient)
      @ingredients_required[ingredient] += quantity
    else
      @ingredients_required[ingredient] = quantity
    end
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    calories = 0
    @ingredients_required.each do |ingredient, quantity|
      calories += quantity * ingredient.calories
    end
    calories
  end
end
