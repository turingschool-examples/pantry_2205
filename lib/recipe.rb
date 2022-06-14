class Recipe
  attr_reader :name, :ingredients_required, :ingredients

  def initialize(info)
    @name = name
    @unit = info[:unit.to_s]
    @calories = info[:calories.to_s]
    @ingredients = ingredients
  end

  def recipe1(name, ingredients_required)
    @recipe1.name = recipe1.name
    @recipe1.ingredients_required = recipe1.ingredients_required
    @name = name
    @ingredients_required = ingredients_required

  end
end
