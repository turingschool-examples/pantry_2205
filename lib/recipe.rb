class Recipe
  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
    @ingredients = []
  end

  def add_ingredient(ingredient, quantity)
    @ingredients_required[ingredient] += quantity
    @ingredients << ingredient if !@ingredients.include?(ingredient)
  end

  def ingredients
    @ingredients
  end

  def total_calories
    @ingredients_required.sum { |ingredient, quantity| ingredient.calories * quantity }
  end

  def ingredients_by_calories
    list = @ingredients_required.sort_by { |ingredient, quantity | ingredient.calories * quantity }
    list.reverse
  end
end
