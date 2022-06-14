require 'pry'
class Pantry

  attr_reader :stock
  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, amount)
    if @stock.include?(ingredient) == false
      @stock[ingredient] = amount
    else
      @stock[ingredient] += amount
    end
  end

  def enough_ingredients_for?(recipe)
     recipe.ingredients_required == @stock
  end
end
