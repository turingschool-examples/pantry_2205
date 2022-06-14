class Recipe
  attr_reader :name, :ingredients_required, :ingredients

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
    @ingredients = []
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] += amount
    @ingredients << ingredient
    @ingredients.uniq!
  end

  def total_calories
    calories = 0
    @ingredients_required.each do |key, value|
      calories += (key.calories * value)
    end
    calories
  end
end
