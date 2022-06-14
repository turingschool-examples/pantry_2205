require './lib/ingredient'

class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    count = 0
    if @stock.keys.include?(ingredient)
      count = @stock.find {|ingredient| ingredient.count}
    end
    count
  end

  def restock(ingredient, quantity)
    if @stock.keys.include?(ingredient)
      @stock[ingredient] += quantity
    else
      @stock[ingredient] = quantity
    end
  end
end
