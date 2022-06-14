class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, count)
    @stock[ingredient] += count
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.each do |ingredient, amount|
      if amount > @stock[ingredient]
        return false
      end
    end
    return true 
  end
end
