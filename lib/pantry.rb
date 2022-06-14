class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    if @stock[ingredient] == nil
      @stock[ingredient] = 0
    else
      @stock[ingredient]
    end
  end

  def restock(ingredient, number)
    if @stock[ingredient] == nil
      @stock[ingredient] = number
    else
      @stock[ingredient] += number
    end
  end

  def enough_ingredients_for?(recipe)
    require "pry"; binding.pry
    required_values = recipe.ingredients_required.values
    ingredients = recipe.ingredients
    #enumerate over required recipe items to be sure values of
    # pantry items is >= required recipe items. out of time
  end
end
