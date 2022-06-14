require_relative './recipe'
class Pantry

  attr_reader :stock

  def initialize
    @stock = {}
    @stock.default = 0
  end

  def stock_check(ingredient)
    if @stock.has_key?(ingredient) == true
      return @stock[ingredient]
    else
      return 0
    end
  end

  def restock(ingredient, quantity)
    @stock[ingredient] += quantity
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.each do |ingredient|
      if stock_check(ingredient[0]) < ingredient[1]
        return false
      end
    end
    return true
  end

end
