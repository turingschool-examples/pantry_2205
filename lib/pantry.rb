class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(ingredient_search)
    @stock[ingredient_search.name]
  end

  def restock(ingredient_add, amount)
    @stock = {ingredient_add.name => amount}
  end
end
