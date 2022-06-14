class Pantry

  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock
  end

  def restock(ingredient, qty)
    @stock[ingredient] += qty
    require "pry"; binding.pry
  end
end
