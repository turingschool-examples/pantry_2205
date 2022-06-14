require_relative 'ingredient'

class Pantry
  attr_accessor :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end

  def enough_ingredients_for?(recipe)
    true_count = []
    require "pry"; binding.pry
  end


end
