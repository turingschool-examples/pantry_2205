require 'pry'
require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require './lib/cook_book'

class Pantry

  attr_reader :stock

  def initialize()
    @stock = {}
  end

  def stock_check(ingredient)
    if stock.include?(ingredient)
      @stock[ingredient]
    else
      0
    end
  end

  def restock(ingredient, amount)
    if stock.include?(ingredient)
      @stock[ingredient] += amount
    else
      @stock[ingredient] = amount
    end
  end

  def enough_ingredients_for?(recipe)
    ingredients = recipe.ingredients_required
    enough = []
    ingredients.each do |ingredient, amount_needed|
      # binding.pry
      if stock_check(ingredient) >= amount_needed
        enough << true
      else
        enough << false
      end
    end
    !enough.include?(false)
  end
end
