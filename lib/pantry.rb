require './lib/helper'

class Pantry
  attr_reader :stock,
              :stock_check,
              :restock

  def initialize
    @stock = {}

  end

  def stock_check(item)
    if @stock[item] == nil
      0
    else
      @stock[item]
    end
  end

  def restock(ingredient, quantity)
    if @stock[ingredient] == nil
      @stock.merge!(ingredient => quantity)
    else
      @stock[ingredient] = @stock[ingredient] + quantity
    end
  end


end
