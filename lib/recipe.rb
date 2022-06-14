require './lib/ingredient'
class Recipe

  attr_reader :name,
              :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
    @ingredients_required.default = 0
  end

  def add_ingredient(ingredient, quantity)
      @ingredients_required[ingredient] += quantity
  end
  
  def total_calories
    total = 0
    @ingredients_required.each do |ingredient, quantity|
      total += (ingredient.calories * quantity)
    end
    return total
  end
end
