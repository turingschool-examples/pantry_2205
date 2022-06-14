class Pantry

  attr_reader :stock
  def initialize
    @stock = Hash.new(0) 
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, qty)
    @stock[ingredient] += qty
  end

  def enough_ingredients_for?(recipe)
    qty_needed = recipe.ingredients_required.values.sum
    current_qty = @stock.values.sum
    return true if current_qty >= qty_needed
    false
  end
end