require 'recipe'

class Pantry

  attr_reader :stock

  def initialize
    @stock = Hash.new
  end

  def stock_check(ingredient)
    if @stock[ingredient] == nil
      @stock[ingredient] = 0
    end
    @stock[ingredient]
  end

  def restock(ingredient, num)
    stock_check(ingredient)
    @stock[ingredient] += num
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required == @stock
  end

end
