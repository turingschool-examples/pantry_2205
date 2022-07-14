class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, quantity)
    @stock[ingredient] += quantity
  end

  def enough_ingredients_for?(recipe)
    needed = recipe.ingredients_required.select { |ingredient, qty| qty > @stock[ingredient] }
    needed.empty?
  end
end
