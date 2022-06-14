class Pantry
  attr_reader :ingredients
  def initialize
    @ingredients = Hash.new(0)
  end

  def stock
    @ingredients
  end

  def stock_check(item)
    @ingredients[item]
  end

  def restock(item, qty)
    @ingredients[item] += qty
  end
end
