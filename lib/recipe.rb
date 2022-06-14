class Recipe
  attr_reader :name, :ingredients_required

  def initialize(argument)
    @name = argument
    @ingredients_required = Hash.new(0)
  end

  def add_ingredient(ingredient, quantity)
    @ingredients_required[ingredient] += quantity
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    @ingredients_required.sum  {|ingredient, quantity| ingredient.calories * quantity}
  end
end
