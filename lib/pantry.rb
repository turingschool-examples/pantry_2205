class Pantry
  attr_reader :stock,
              :restock

  def initialize
    @stock = Hash.new(0)
    @restock = 0
  end


  def stock_check(item)
    @stock[item]
  end

  def restock(item, amount)
    @stock[item] += amount
  end
end
