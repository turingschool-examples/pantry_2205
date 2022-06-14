class Pantry
  attr_reader :stock

  def initialize
     @stock = {}
  end

  def stock_check(ingredient)
    # require "pry"; binding.pry
    if @stock[ingredient.name] == nil
      @stock[ingredient.name] = 0
    else
      @stock[ingredient.name]
    end
  end


end
