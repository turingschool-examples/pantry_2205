require 'pry'

class Recipe
  attr_reader :name, :ingredients_required
  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, amount)
    if @ingredients_required[ingredient] == nil
      @ingredients_required[ingredient] = amount
    else
      @ingredients_required[ingredient] += amount
    end
  end

  def total_calories
    calories = 0
    @ingredients_required.each do |ingredient|
      # binding.pry
      calories += (ingredient[0].calories * ingredient[1])
    end
    calories
  end

end
