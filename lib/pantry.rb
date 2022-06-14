class Pantry

  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, amt)
    @stock[ingredient] += amt
  end

  def enough_ingredients_for?(recipe)
    rec_hash = recipe.ingredients_required
    enough_array = rec_hash.map { |ing,amt| @stock[ing] >= amt }
    if enough_array.all? { |bool| bool == true }
      true
    else
      false
    end
  end
end
