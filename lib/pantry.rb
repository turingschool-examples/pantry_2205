class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def check_stock(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end
end
