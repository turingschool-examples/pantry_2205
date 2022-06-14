class Pantry
  attr_reader :stock

  def initialize()
    @stock = Hash.new(0)
  end
      #i am confused why the method below does not work I keep getting an argument error that I am just not seeing
  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, total)
    @stock[ingredient] += total
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients.each do |ingredient|
      if stock_check(ingredient) < recipe.amount_required(ingredient)
        return false
      end
    end
    return true
  end

end
