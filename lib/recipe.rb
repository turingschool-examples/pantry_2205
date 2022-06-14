class Recipe
  attr_reader :name,
              :ingredients_required,
              :ingredients

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
    @ingredients = []
  end

  def add_ingredient(ingredient, quantity)
    @ingredients_required[ingredient] += quantity
      @ingredients << ingredient
      @ingredients.uniq!
  end

  def total_calories
    @ingredients_required.sum { |ingredient, quantity| ingredient.calories * quantity }
  end
end
