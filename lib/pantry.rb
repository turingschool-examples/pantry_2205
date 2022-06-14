require_relative 'ingredient'
require_relative 'recipe'

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
    @stock.each do |ingredient, amount|
      if (recipe.ingredients_required.keys.include? ingredient) && (@stock[ingredient] >= recipe.ingredients_required[ingredient]) && (@stock.keys.size >= recipe.ingredients_required.keys.size)
        true_count << 1
      else
        true_count << 0
      end
    end
    !true_count.include? 0
  end
end
