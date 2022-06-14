class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    # require "pry"; binding.pry
    if @stock[ingredient] == nil
      @stock[ingredient] = 0
    else
      @stock[ingredient]
    end
  end

  def restock(ingredient, number)
    if @stock[ingredient] == nil
      @stock[ingredient] = number
    else
      @stock[ingredient] += number
    end
  end
end
