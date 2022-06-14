require './lib/ingredient'
require './lib/recipe'

class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    count = 0
    if @stock.keys.include?(ingredient)
      return @stock[ingredient]
    end
    count
  end

  def restock(ingredient, quantity)
    if @stock.keys.include?(ingredient)
      @stock[ingredient] += quantity
    else
      @stock[ingredient] = quantity
    end
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.each do |ingredient, quantity|
      if stock_check(ingredient) < quantity
        return false
      end
    end
    return true
  end
end
