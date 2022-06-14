class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    return 0 if @stock == {}
    if @stock.include?(ingredient)
      @stock[ingredient]
    else
      0
    end
  end

  def restock(ingredient, quantity)
    if @stock.include?(ingredient) == false
      @stock[ingredient] = quantity
    else
      @stock[ingredient] += quantity
    end
  end
end
