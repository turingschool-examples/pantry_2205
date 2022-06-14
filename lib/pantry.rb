require_relative 'recipe'
class Pantry 
  attr_reader :stock

  def initialize
    super
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end
end
