class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, quantity)
    @stock[ingredient] += quantity
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.each do |ingredient, quantity|
      if !@stock[ingredient] || @stock[ingredient] < recipe.ingredients_required[ingredient]
        return false
      end
    end
    return true
  end
end
