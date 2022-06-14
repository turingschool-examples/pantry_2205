class Recipe
  attr_reader :name, :ingredients

  def initialize(recipe_name)
    @name = recipe_name
    @ingredients= {}
  end

  def add_ingredient(ingredient, quantity)
    @ingredients = {ingredient.name => quantity}
  end
end
