require 'pry'
class Recipe

  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
  end

  def add_ingredient(ingredient, amount)
    if @ingredients_required.include?(ingredient) == false
      @ingredients_required[ingredient] = amount
    else
      @ingredients_required[ingredient] += amount
    end
  end

  def ingredients
    ingredients = []
    @ingredients_required.each do |ingredient, amount|
      ingredients << ingredient
    end
    ingredients
  end

  def total_calories
    total = 0
    @ingredients_required.each do |ingredient, amount|
      cals = ingredient.calories * amount
      total += cals
    end
    total
  end
end
