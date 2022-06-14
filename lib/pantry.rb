require 'ingredient'

class Pantry

  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    if @stock[ingredient] == nil
      return 0
    else
      @stock[ingredient]
    end
  end

  def restock(ingredient,amount)
    if @stock[ingredient] == nil
      @stock[ingredient] = amount
    else
      @stock[ingredient] = (@stock[ingredient] += amount)
    end
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.all? {|ingredient,amount| stock_check(ingredient) > amount}
  end

end
