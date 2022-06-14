class Recipe
  attr_reader :name, :ingredients
  def initialize(name)
    @name = name
    @ingredients = Hash.new(0)
  end

  def ingredients_required
    @ingredients
  end

  def add_ingredient(item, qty)
   @ingredients[item] += qty
  end

  def ingredients_total_calories(ingredient, qty)
    ingredient.calories * qty
  end

  def total_calories(recipe)
    binding.pry
    recipe.ingredients

  end

end
