class Pantry
  attr_reader :stock
  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    if @stock[ingredient].nil?
      0
    else
      @stock[ingredient]
    end
  end

  def restock(ingredient, amount)
    if @stock[ingredient].nil?
      @stock[ingredient] = amount
    else
      @stock[ingredient] += amount
    end
  end
end
